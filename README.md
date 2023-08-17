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

## Cuda Install 
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda-11-1
```

## Installation Instructions:

1. Before the next step: DO NOT INSTALL `docker-buildx-plugins`. It will cause the gpu to be inaccessible during docker build

1. Follow the steps on https://docs.docker.com/engine/install/ubuntu/

1. From https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html:
   1.1 Setup and verify toolkit install
   ```
   sudo apt-get update \
    && sudo apt-get install -y nvidia-container-toolkit-base
   nvidia-ctk --version
   sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml
   ```
   Verify with `grep "  name:" /etc/cdi/nvidia.yaml`, which should show the gpus. 

   2.1 Link with Docker
   ```
   sudo apt-get update
   sudo apt-get install -y nvidia-container-toolkit
   sudo nvidia-ctk runtime configure --runtime=docker
   sudo systemctl restart docker
   ```
   Verify with: `docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi`

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

