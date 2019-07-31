# docker-ros-vnc 🐋
VNC container for ROS(kinetic/melodic) and ROS2(crystal/dashing).

This container image based on [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc).

## Support
+ kinetic
+ melodic
+ crystal
+ dashing

## How to build
```
make
```

## Usage
Example: kinetic-base
```
docker run -p 6080:80 naokitakahashi12/ros-vnc:kinetic-base
```
Access to [localhost:6080](http://localhost:6080).
