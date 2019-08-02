FROM naokitakahashi12/ros-vnc:melodic-base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-melodic-desktop \
		&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
