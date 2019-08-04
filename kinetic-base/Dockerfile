FROM dorowu/ubuntu-desktop-lxde-vnc:xenial
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		wget \
		lsb-release \
		software-properties-common \
		&& \
	echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
	wget http://packages.ros.org/ros.key -O - | apt-key add - && \
	apt update && \
	apt install -y \
		ros-kinetic-ros-base \
		&& \
	bash -c '. /opt/ros/kinetic/setup.bash; rosdep init; rosdep update' && \
	echo 'source /opt/ros/kinetic/setup.bash' >> /root/.bashrc && \
	echo 'source /opt/ros/kinetic/setup.bash' >> /home/ubuntu/.bashrc && \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
