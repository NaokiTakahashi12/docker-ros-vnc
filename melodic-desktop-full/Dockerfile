FROM naokitakahashi12/ros-vnc:melodic-desktop
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-melodic-desktop-full \
		&& \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
