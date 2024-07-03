## Install from nvidia CUDA Image
FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

## Install Apt Dependencies
RUN apt-get update && apt-get install -y wget git g++ nano

## Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /miniconda
RUN rm miniconda.sh
ENV PATH="/miniconda/bin:${PATH}"
RUN echo 'export PATH="/miniconda/bin:${PATH}"' >> ~/.bashrc
RUN /miniconda/bin/conda init

## Setup Conda Env from DROID-SLAM
WORKDIR /app
RUN git clone --recurse-submodules https://github.com/ub-cavas/DROID-SLAM.git
WORKDIR /app/DROID-SLAM
## Use our updated environment.yaml
ADD environment.yaml .
RUN conda env create -f environment.yaml
# Make RUN commands use the new environment
SHELL ["conda", "run", "-n", "droidenv", "/bin/bash", "-c"]

## Install Remaining Dependencies
RUN pip install evo --upgrade --no-binary evo
RUN pip install gdown
RUN pip install open3d -U
RUN pip install -r requirements.txt

## Run DROID-SLAM Setup
RUN echo 'conda activate droidenv' >> ~/.bashrc
RUN python setup.py install