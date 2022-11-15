FROM ros:noetic-ros-base

ENV DEBIAN_FRONTEND noninteractive

# Install system dependencies for convinient development inside container
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    net-tools \
    ros-noetic-ros-base \
    python3-pip \
    software-properties-common \
    sudo \
    openssh-server \
    libc6 \
    tar \
    vim \
    tmux \
    pkg-config \
    libcanberra-gtk-module \
    ffmpeg \
    ros-noetic-avt-vimba-camera \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:rock-core/qt4 && apt-get update && apt-get install -y \
    libqtcore4 \
    libqt4-dev \
    libqt4-network \
    libqt4-qt3support \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools

COPY Vimba64_v6.0_Linux.tgz .
RUN tar -xzf ./Vimba64_v6.0_Linux.tgz -C /opt

RUN mkdir -p /etc/udev/rules.d \
    && cd /opt/Vimba_6_0/VimbaGigETL/ \
    && ./Install.sh \
    && cd ../VimbaPython/Source/ \
    && python3 -m pip install . \
    && cd /

ENV GENICAM_GENTL64_PATH=$GENICAM_GENTL64_PATH:"/opt/Vimba_6_0/VimbaGigETL/CTI/x86_64bit"

# ENTRYPOINT  ["./ros_entrypoint.sh", "roslaunch", "avt_vimba_camera", "mono_camera.launch"]