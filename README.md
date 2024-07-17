# docker-droid-slam

Create a docker container for running [DROID-SLAM](https://github.com/fusionportable/DROID-SLAM)

## Build DROID-SLAM Container
`docker build . -t droid-slam:latest`

## Run DROID-SLAM Container
#### 1) Run DROID-SLAM Container:
`docker run --gpus all -it droid-slam:latest`

#### 2) Run DROID-SLAM Container w/ Bind Mount:
`docker run -it --name droid-slam -v /host/system/dataset/:/app/dataset/ droid-slam:latest`

## Run DROID-SLAM Container Detached To Resume As Long As Container Is Running
#### 1) Run DROID-SLAM Container In Detached:
`docker run -it -d --name droid-slam -v /host/system/dataset/:/app/dataset/ droid-slam:latest`

#### 2) Enter Running Container:
`docker exec -it droid-slam /bin/bash`

## Delete DROID-SLAM Container
`docker container remove droid-slam`
