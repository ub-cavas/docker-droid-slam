FROM continuumio/miniconda3
WORKDIR /app
RUN git clone --recursive https://github.com/princeton-vl/DROID-SLAM.git
WORKDIR DROID-SLAM
RUN conda env create -f environment.yaml
RUN conda activate droidenv
RUN conda install cudatoolkit-dev=11.3
RUN pip install evo --upgrade --no-binary evo
RUN pip install gdown
RUN pip install open3d -U
RUN python setup.py install