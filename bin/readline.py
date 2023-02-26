from googletrans import Translator
translator = Translator()

translated = ""
collector = ""
myfile = open("eng.txt", "r")
while myfile:
    line  = myfile.readline()

    if line == "":
        break

    print(line)

    translated = translator.translate(line, dest='hi',src='en',).text
    print(translated)
    collector = collector + translated


print(collector)

with open('hin.txt', 'w') as f:
    f.write(collector)


from gtts import gTTS
import os

language = 'hi'

print("starting audio conversion")
myobj = gTTS(text=collector, lang=language, slow=False)
myobj.save("hindi.mp3")

myfile.close() 
