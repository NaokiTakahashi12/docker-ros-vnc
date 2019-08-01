FROM naokitakahashi12/ros-vnc:kinetic-base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-kinetic-desktop \
		&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
