# docker-droid-slam

Create a docker container for running [DROID-SLAM](https://github.com/fusionportable/DROID-SLAM)

## Build DROID-SLAM Container
`docker build . -t droid-slam:latest`

## Run DROID-SLAM Container
`docker run --gpus all -it droid-slam:latest`