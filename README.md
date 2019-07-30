# docker-ros-vnc 🐋
VNC container for ROS(kinetic/melodic).

This container image based on [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc).

## How to build
```
make
```

## Usage
Example: kinetic-base
```
docker run -p 6080:80 ros-vnc:kinetic-base
```
Access to [localhost:6080](http://localhost:6080).
