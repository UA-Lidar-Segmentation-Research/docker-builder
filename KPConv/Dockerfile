FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

RUN pip install --no-cache-dir \
    numpy==1.23.0 \
    scikit-learn==1.3.0\
    matplotlib==3.7.2

COPY cpp_wrappers /tmp/cpp_wrappers

WORKDIR /tmp/cpp_wrappers
RUN sh compile_wrappers.sh

WORKDIR /model/KPConv-PyTorch
