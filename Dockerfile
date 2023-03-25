# Starting from a ROS Noetic image
FROM ros:noetic-ros-core-focal
SHELL ["/bin/bash", "-c"]

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools \
    python3-catkin-tools \
    python3-osrf-pycommon \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# Install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-ros-base=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*

# Install and update ubuntu packages
RUN apt-get update && apt-get upgrade -y

# Install python packages
RUN apt install -y python3 python3-pip

# Creating a ROS workspace to SSL data
RUN mkdir ssl_ws && cd ssl_ws && mkdir src && cd src

# Install grSim dependencies
RUN apt install -y git build-essential cmake pkg-config qt5-default \
                   libqt5opengl5-dev libgl1-mesa-dev libglu1-mesa-dev \
                   libprotobuf-dev protobuf-compiler libode-dev libboost-dev

# Clone another packages
RUN cd /ssl_ws/src && \
    git clone https://github.com/Los-UruBots-del-Norte/vision_comm.git && \
    git clone https://github.com/Los-UruBots-del-Norte/grsim_ros_bridge_msgs.git && \
    git clone https://github.com/Los-UruBots-del-Norte/grsim_ros_bridge.git && \
    git clone https://github.com/KRSSG/krssg_ssl_msgs.git


# Correcting an error at grsim_ros_bridge package
RUN cd /ssl_ws/src/grsim_ros_bridge/scripts && ls && \
    sed -i "s|/home/ricardo/ssl_ws|/ssl_ws|g" run_grsim.py

# Clone SSL simulator
RUN cd ssl_ws && git clone https://github.com/RoboCup-SSL/grSim.git

# Enter the grSim folder
RUN cd ssl_ws/grSim && \
    mkdir build && cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=usr/local .. && make

# Copy the data folder to the workspace
COPY /src /ssl_ws/src/data

# Build the workspace
RUN source opt/ros/noetic/setup.bash && cd /ssl_ws && catkin_make

# Launch package
# RUN cd /ssl_ws && roslaunch grsim_ros_bridge launch.launch