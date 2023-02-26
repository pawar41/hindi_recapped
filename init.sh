limit=1

for word in $(cat links.txt)
do
  mkdir -p data/$limit/media data/$limit/kdenlive data/$limit/upload data/$limit/subtitle data/$limit/tmp
  touch data/$limit/link.txt
  touch data/$limit/subtitle/eng.txt
  touch data/$limit/subtitle/hin.txt

  echo $word >> data/$limit/link.txt
  echo $limit $word

  cp bin/sub.py data/$limit/subtitle/
  cp bin/readline.py data/$limit/subtitle/
  cp bin/intro.mp3 data/$limit/media

  cp bin/*.mp3 data/$limit/media
  cp bin/movie.png data/$limit/media

  cd data/$limit/media
  yt-dlp -f 137 --write-subs en --sub-format vtt --write-thumbnail $(cat ../link.txt)
  yt-dlp -f 140 $(cat ../link.txt)
  
  mv *.vtt ../subtitle/sub.vtt
  mv *.webp ../upload/thumb.jpeg
  cd ../../../

  ((limit=limit+1)) 
done


((limit=1))

for word in $(cat links.txt)
do
  cd data/$limit/subtitle/
  echo "Audio out :" $limit
  python3 sub.py
  python3 readline.py
  mv hindi.mp3 ../media/
  ((limit=limit+1))
  cd ../../../
done
