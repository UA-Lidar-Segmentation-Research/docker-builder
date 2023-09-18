FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel

RUN pip install --no-cache-dir \
    spconv-cu111==2.1.25 \
    torch-scatter==2.1.1 \
    strictyaml \
    numba==0.57.1 \
    numpy==1.21

WORKDIR /model/Cylinder3D
