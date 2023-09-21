FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel

COPY ./cpp_wrappers /model/KPConv-PyTorch/cpp_wrappers

WORKDIR /model/KPConv-PyTorch/cpp_wrappers
RUN sh compile_wrappers.sh

RUN pip install --no-cache-dir \
    numpy==1.23.0 \
    scikit-learn==1.3.0\
    matplotlib==3.7.2

WORKDIR /model/KPConv-PyTorch
