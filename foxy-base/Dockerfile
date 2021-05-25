FROM dorowu/ubuntu-desktop-lxde-vnc:focal
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
	apt update --quiet && \
	apt upgrade -y && \
	apt install -y --no-install-recommends \
		software-properties-common \
		git \
		curl \
		wget \
		gnupg2 \
		lsb-release \
		python3-argcomplete \
	&& \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
	apt update && \
	apt install -y \
		python3-rosdep \
		ros-foxy-ros-base \
	&& \
	bash -c '. /opt/ros/foxy/local_setup.bash; rosdep init; rosdep update' && \
	echo 'source /opt/ros/foxy/local_setup.bash' >> /root/.bashrc && \
	echo 'source /opt/ros/foxy/local_setup.bash' >> /home/ubuntu/.bashrc && \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
