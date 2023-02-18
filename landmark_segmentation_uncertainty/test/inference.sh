#!/bin/bash

cd $(realpath ${0} | xargs dirname)

IMG='./img'
IMG_RAI='./img_rai'
MODEL='verse2019_jmid_1100cases'  # 'verse19', 'verse2019', 'verse2019_jmid_100cases', 'verse2019_jmid_1100cases'
RESULTS="./results/${MODEL}"


python ../inference/reorient_reference_to_rai.py \
  --image_folder ${IMG} \
  --output_folder ${IMG_RAI}

python ../inference/main_spine_localization.py \
  --image_folder ${IMG_RAI} \
  --output_folder ${RESULTS} \
  --setup_folder ${RESULTS} \
  --model_files ../models/${MODEL}/spine_localization/model

python ../inference/main_vertebrae_localization.py \
  --image_folder ${IMG_RAI} \
  --output_folder ${RESULTS} \
  --setup_folder ${RESULTS} \
  --model_files ../models/${MODEL}/vertebrae_localization/model

python ../inference/main_vertebrae_segmentation_bn.py \
  --image_folder ${IMG_RAI} \
  --output_folder ${RESULTS} \
  --setup_folder ${RESULTS} \
  --model_files ../models/${MODEL}/vertebrae_segmentation/model

python ../inference/reorient_prediction_to_reference.py \
  --image_folder ${RESULTS}/vertebrae_bayesian_segmentation_rai \
  --reference_folder ${IMG} \
  --output_folder ${RESULTS}/vertebrae_bayesian_segmentation_original

