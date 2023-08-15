#!/bin/bash

while getopts d:m: flag
do
    case "${flag}" in
      d) DATA_DIR=${OPTARG};;
      m) RUN_MODEL=${OPTARG};;
      *) echo "usage: $0 [-d]" >&2
        exit 1 ;;
    esac

done
echo "DATA_DIR: $DATA_DIR";
echo "PWD: $PWD";


if [ -z "$DATA_DIR" ]
then
  echo "Use -d to specify data directory"
  exit
fi

if [ -z "$RUN_MODEL" ]
then
  echo "Use -m to specify model: ex. ' -m salsanext'"
  exit
fi

case $RUN_MODEL in
  sphereformer)
    cd ../SphereFormer || exit
    docker run --rm -it --shm-size 8G -v "$DATA_DIR":/dataset -v "$(pwd)":/model/SphereFormer ghcr.io/ua-lidar-segmentation-research/sphereformer:latest /bin/bash
    ;;
  salsanext)
    cd ../SalsaNext || exit
    docker run --rm -it --shm-size 8G -v "$DATA_DIR":/dataset -v "$(pwd)":/model/SalsaNext ghcr.io/ua-lidar-segmentation-research/salsanext:latest /bin/bash
    ;;
  kpconv)
    cd ../KPConv-PyTorch || exit
    docker run --rm -it --shm-size 8G -v "$DATA_DIR":/dataset -v "$(pwd)":/model/KPConv-PyTorch ghcr.io/ua-lidar-segmentation-research/kpconv:latest /bin/bash
    ;;
  cylinder3d)
    cd ../Cylinder3D || exit
    docker run --rm -it --shm-size 8G -v "$DATA_DIR":/dataset -v "$(pwd)":/model/Cylinder3D ghcr.io/ua-lidar-segmentation-research/cylinder3d:latest /bin/bash
    ;;
  pvkd)
    cd ../PVKD || exit
    docker run --rm -it --shm-size 8G -v "$DATA_DIR":/dataset -v "$(pwd)":/model/PVKD ghcr.io/ua-lidar-segmentation-research/pvkd:latest /bin/bash
    ;;
  *)
    echo "Selected model is invalid"
    ;;
esac
