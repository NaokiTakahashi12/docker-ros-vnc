FROM melodic-base/ros-vnc
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
	apt update && \
	apt upgrade -y && \
	apt install -y \
		wget \
		software-properties-common \
		lsb-release \
		dirmngr --install-recommends \
		&& \
	echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
	wget http://packages.ros.org/ros.key -O - | apt-key add - && \
	apt update && \
	apt install -y \
		ros-melodic-desktop \
		&& \
	bash -c '. /opt/ros/melodic/setup.bash; rosdep init; rosdep update' && \
	echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
