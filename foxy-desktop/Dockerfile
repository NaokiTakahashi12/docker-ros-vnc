FROM naokitakahashi12/ros-vnc:foxy-base
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-foxy-desktop \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
