# vertebral-alignment-analysis-platform

## Localization and Bayesian Segmentation of Vertebrae

```bash
cd ./landmark_segmentation_uncertainty
```

The approach and implementation of the vertebrae localization and segmentation is based on the paper and its project:

* [Coarse to Fine Vertebrae Localization and Segmentation with SpatialConfiguration-Net and U-Net](https://cpb-ap-se2.wpmucdn.com/blogs.auckland.ac.nz/dist/1/670/files/2020/06/2020PayerVISAPP.pdf) 
* [MedicalDataAugmentationTool-VerSe](https://github.com/christianpayer/MedicalDataAugmentationTool-VerSe/tree/master/verse2019)

We also used the following toolkits:
* [MedicalDataAugmentationTool](https://github.com/christianpayer/MedicalDataAugmentationTool)
* [volume-renderer](https://github.com/yuta-hi/volume-renderer)

### Method
Vertebrae localization and segmentation are performed by a three-stage fully automatic approach:
1) Spine localization,
2) Vertebrae localization
3) Binary segmentation of each localized and identified vertebrae

Additionally, the segmentation network in the final stage is reformed to the Bayesian 3D U-Net to estimate segmentation uncertainty by multiple test-time MC dropout samples

![ad](https://github.com/zhuo-cheng/Vertebral-Alignment-Analysis-Platform/blob/master/sample_figs/approach.png)

### Models
The models trained by the dataset VerSe 2019 in the repo are from the project [MedicalDataAugmentationTool-VerSe](https://github.com/christianpayer/MedicalDataAugmentationTool-VerSe/tree/master/verse2019). 

We also released the new models: (To be updated)
* **Spine localization and vertebrae localization**: trained by 1180 CT cases (1000 cases from J-MID and 80 cases from VerSe 2019)
* **Vertebrae Bayesian segmentation**: trained by 180 CT cases (100 cases from J-MID and 80 cases from VerSe 2019)

### Environment

Pull image from [Docker Hub](https://hub.docker.com/repository/docker/tomo2321/landmark_segmentation_uncertainty/general).

```bash
docker pull tomo2321/landmark_segmentation_uncertainty:latest
```

Or create a brand new docker image from Dockerfile.

```bash
docker build -t <YOUR_IMAGE_NAME> .
```

### Inference

Make a new directory named *img* and put your CT images in it.
```bash
cd ./test
mkdir ./img
```

Choose a model from models and modify the *MODEL* variable in the bash script.
Run the bash script for the inference.

```bash
bash inference.sh
```

If you get an error regarding carriage return in the bash script, try the following command first.

```bash
sed -i 's/\r//g' inference.sh
```

### Visualization

Choose a model from models and modify the *MODEL* variable in the bash script.
Run the bash script for the visuliazatrion of results.

```bash
bash visualization_all.sh
```

**Examples of visuliazation**
<p float="left">
<img src="https://github.com/zhuo-cheng/Vertebral-Alignment-Analysis-Platform/blob/master/sample_figs/render_vis_1.png" width="410">
<img src="https://github.com/zhuo-cheng/Vertebral-Alignment-Analysis-Platform/blob/master/sample_figs/render_vis_2.png" width="410">
</p>

## Spine Alignment Analysis

```bash
cd ./alignment_analysis
```

**To be updated.**

