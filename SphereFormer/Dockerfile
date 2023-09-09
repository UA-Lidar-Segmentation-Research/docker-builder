FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel


COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app

RUN nvidia-smi

RUN pip install --no-cache-dir \
    torch_scatter==2.0.9 \
    torch_geometric==1.7.2 \
    spconv-cu114==2.1.21 \
    torch_sparse==0.6.12 cumm-cu114==0.2.8 torch_cluster==1.5.9 \
    tensorboard timm termcolor tensorboardX \
    markupsafe==2.0.1

COPY third_party/SparseTransformer /tmp/
WORKDIR /tmp
RUN python setup.py install

COPY train_ua_model.sh /model/Sphereformer/

WORKDIR /model/SphereFormer/
