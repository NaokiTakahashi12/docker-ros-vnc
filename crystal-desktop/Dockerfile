FROM naokitakahashi12/ros-vnc:crystal-base
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-crystal-desktop \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
