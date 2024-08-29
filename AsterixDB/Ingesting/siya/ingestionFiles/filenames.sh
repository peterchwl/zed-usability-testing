for file in ./heterogeneous/*; do       
  f=$(echo "${file##*/}");
  filename=$(echo $f| cut  -d'.' -f 1); #file has extension, it return only filename
  echo $filename >> allmodels.txt
done
