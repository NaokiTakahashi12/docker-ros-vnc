FROM naokitakahashi12/ros-vnc:dashing-base
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-dashing-desktop \
	&& \
	apt autoremove -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
