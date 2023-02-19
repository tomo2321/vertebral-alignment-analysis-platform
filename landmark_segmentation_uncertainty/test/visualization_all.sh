#!/bin/bash

cd $(realpath ${0} | xargs dirname)

IMG='./img'
MODEL='verse2019_jmid_1100cases'
RESULTS="./results/${MODEL}"
VISUALIZATION='./visualization'

export DISPLAY=:99.0
Xvfb ${DISPLAY} -screen 0 1024x768x24 > /dev/null 2>&1 &
sleep 3
exec "$@"

python ../volume-renderer-master/render_with_all_results_arg.py \
  --img_folder ${IMG} \
  --seg_folder ${RESULTS}/vertebrae_bayesian_segmentation_original \
  --csv_folder ${RESULTS}/vertebrae_localization \
  --vis_folder ${VISUALIZATION}
