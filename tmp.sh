#limit=1

#for i in {1..8}
#do 
#  cp data/$i/upload/*.mp4 uploads/
#  ((limit=limit+1))
#done


((limit=1))

for word in $(cat links.txt)
do
  cp data/$i/upload/*.mp4 uploads/$limit.mp4
  ((limit=limit+1))
done
