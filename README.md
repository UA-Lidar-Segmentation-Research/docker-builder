# docker-builder

This repo must be cloned alongside the repos for the models it is building images for. 

EX. 
```
top-level-dir
  |--> docker-builder
  |--> KPConv-PyTorch
  |--> SalsaNext
  |--> SphereFormer
```

## Installation Instructions:

1. Before the next step: DO NOT INSTALL `docker-buildx-plugins`. It will cause the gpu to be inaccessible during docker build

1. Follow the steps on https://docs.docker.com/engine/install/ubuntu/

1. Install `nvidia-container-runtime` using `sudo apt install nvidia-container-runtime`

1. Follow instruction 1. from https://medium.com/@jgleeee/building-docker-images-that-require-nvidia-runtime-environment-1a23035a3a58

## Building Docker Containers
`./build.sh [kpconv salsanext sphereformer]`

## Running the models:
1. Run the container
   2. `./run.sh -d /media/$USER/data_drive/dataset -m [kpconv salsanext sphereformer]`
3. Train the model: 
   4. Each model has a script `./train_ua_model.sh` that will train the network with default settings. 
5. Individual commands: 
   4. SphereFormer: `python train.py --config config/semantic_kitti/semantic_kitti_unet32_spherical_transformer.yaml`
   5. SalsaNext: `./train.sh -d /dataset -a salsanext.yml -l /logs -c 0`
   6. KPConv: `No Idea Yet`

