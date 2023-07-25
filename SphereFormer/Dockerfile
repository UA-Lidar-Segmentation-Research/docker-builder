FROM pytorch/pytorch:1.8.0-cuda11.1-cudnn8-devel


COPY requirements.txt /opt/app/requirements.txt
WORKDIR /opt/app

RUN nvidia-smi

RUN python3 -m pip install -r requirements.txt

#ARG SPARSETRANSFORMER_DIR
#ARG SPHEREFORMER_DIR
#RUN echo ${SPARSETRANSFORMER_DIR}
COPY SphereFormer/third_party/SparseTransformer /tmp/
WORKDIR /tmp
RUN pwd && ls
#RUN ls /tmp/SphereFormer/third_party
#RUN ls /tmp/SphereFormer/third_party/SparseTransformer
RUN python setup.py install