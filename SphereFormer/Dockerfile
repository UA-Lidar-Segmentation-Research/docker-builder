FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel


COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app

RUN nvidia-smi

RUN python3 -m pip install -r requirements.txt

COPY third_party/SparseTransformer /tmp/
WORKDIR /tmp
RUN python setup.py install

COPY train_ua_model.sh /model/Sphereformer/

WORKDIR /model/SphereFormer/