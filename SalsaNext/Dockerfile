FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel

RUN rm /etc/apt/sources.list.d/* && apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    numpy==1.23.0 \
    opencv-python==4.8.0.74  \
    matplotlib==3.7.2  \
    scipy==1.10.1  \
    tensorflow==2.13.0

COPY train_ua_model.sh /model/SalsaNext/

WORKDIR /model/SalsaNext/
