FROM dorowu/ubuntu-desktop-lxde-vnc:bionic
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
	apt update && \
	apt upgrade -y && \
	apt install -y \
		software-properties-common \
		git \
		curl \
		wget \
		gnupg2 \
		lsb-release \
		python3-argcomplete \
	&& \
	curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
	sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
	apt update && \
	apt install -y \
		python-rosdep \
		ros-dashing-ros-base \
	&& \
	bash -c '. /opt/ros/dashing/local_setup.bash; rosdep init; rosdep update' && \
	echo 'source /opt/ros/dashing/local_setup.bash' >> ~/.bashrc && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
