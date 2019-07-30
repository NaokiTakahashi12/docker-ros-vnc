FROM ros-vnc:dashing-base
RUN apt update && \
	apt upgrade -y && \
	apt install -y \
		ros-dashing-desktop \
	&& \
	apt clean && \
	rm -rf /var/lib/apt/lists/*
