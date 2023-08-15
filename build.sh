#! /bin/bash

case $1 in
  sphereformer)
#    cp SphereFormer/Dockerfile ../SphereFormer/Dockerfile
    cp SphereFormer/* ../SphereFormer/
    docker build -t ghcr.io/ua-lidar-segmentation-research/sphereformer:latest ../SphereFormer
    rm ../SphereFormer/Dockerfile
    ;;
  salsanext)
    cp SalsaNext/* ../SalsaNext/
    docker build -t ghcr.io/ua-lidar-segmentation-research/salsanext:latest ../SalsaNext
    rm ../SalsaNext/Dockerfile
    ;;
  kpconv)
    cp KPConv/* ../KPConv-PyTorch/
    docker build -t ghcr.io/ua-lidar-segmentation-research/kpconv:latest ../KPConv-PyTorch
    rm ../KPConv-PyTorch/Dockerfile
    ;;
  cylinder3d)
    cp Cylinder3D/* ../Cylinder3D/
    docker build -t ghcr.io/ua-lidar-segmentation-research/cylinder3d:latest ../Cylinder3D
    rm ../Cylinder3D/Dockerfile
    ;;
  pvkd)
    cp -r PVKD/* ../PVKD/
    docker build -t ghcr.io/ua-lidar-segmentation-research/pvkd:latest ../PVKD
    rm ../PVKD/Dockerfile
    ;;
  *)
    echo "INVALID MODEL: Choose a supported model"
    ;;
esac

#if [ -z ${SPHEREFORMER_DIR}]



#docker build -f Dockerfile -t ghcr.io/ua-lidar-segmentation-research/sphereformer:latest .
#docker build --build-arg SPHEREFORMER_DIR=/home/mmcvicker/research/thesis/ua-lidar-segmentation-research/SphereFormer --build-arg SPARSETRANSFORMER_DIR=/home/mmcvicker/research/thesis/ua-lidar-segmentation-reseCASEarch/SphereFormer/third_party/SparseTransformer/ -f Dockerfile -t ghcr.io/ua-lidar-segmentation-research/sphereformer:latest .