for filepath in "data/euroc_groundtruth"/*
do
  export DATASET_NAME=$(basename $filepath .txt)
  echo $DATASET_NAME  
  python demo.py \
    --imagedir=/dataset/EuRoC/$DATASET_NAME/mav0/cam0/data \
    --calib=calib/euroc.txt \
    --disable_vis \
    --reconstruction_path=$DATASET_NAME \
    --t0=8 
  python droid_slam/vins/eval.py
done