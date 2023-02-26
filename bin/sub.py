import webvtt
vtt = webvtt.read('sub.vtt')
transcript = ""

lines = []
for line in vtt:
    lines.extend(line.text.strip().splitlines())

previous = None
for line in lines:
    if line == previous:
       continue
    transcript += " " + line
    previous = line

transcript = transcript.replace('&nbsp;',' ')
transcript = transcript.replace('.','.\n')
transcript = transcript.replace('  ',' ')
transcript = transcript.replace('   ',' ')
transcript = transcript.replace('    ',' ')

print(transcript)

with open('eng.txt', 'w') as f:
    f.write(transcript)
