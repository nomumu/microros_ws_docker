FROM ubuntu:jammy

LABEL maintainer="nomumu <nomumu-github@koso2-dan.ddo.jp>"

RUN apt-get update -y && apt-get install -y apt-utils
RUN apt-get update -y && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 
RUN apt-get update -y && apt-get install -y locales curl gnupg2 lsb-release
RUN apt-get update -y && apt-get install -y curl gnupg2 lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt-get update -y && apt-get install -y ros-humble-ros-base python3-rosdep
RUN apt-get update -y && apt-get install -y vim git sudo zsh 
RUN apt-get update -y && apt-get install -y flex libasio-dev libcurl4-openssl-dev clang-tidy python3-vcstool bison libncurses5-dev usbutils
RUN apt-get update -y && apt-get install -y libpython3-dev python3-pip && pip3 install -U argcomplete

RUN apt-get update -y && apt-get install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8-docstrings \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  ros-dev-tools \
  wget
RUN apt-get update -y && apt-get install -y \
  python3-flake8-blind-except \
  python3-flake8-builtins \
  python3-flake8-class-newline \
  python3-flake8-comprehensions \
  python3-flake8-deprecated \
  python3-flake8-import-order \
  python3-flake8-quotes \
  python3-pytest-repeat \
  python3-pytest-rerunfailures
RUN apt-get update -y && apt-get install --no-install-recommends -y libasio-dev libtinyxml2-dev
RUN apt-get update -y && apt-get install --no-install-recommends -y libcunit1-dev

RUN apt-get update -y && apt-get install --no-install-recommends -y clang-format python3-mypy python3-pytest-mock python3-nose gperf python3-venv ros-humble-osrf-testing-tools-cpp ros-humble-mimick-vendor python3-babeltrace python3-lttng

RUN /bin/bash -c "source /opt/ros/humble/setup.bash" && rosdep init

RUN echo "Defaults visiblepw" >> /etc/sudoers

CMD echo 'Create micro-ROS workspace docker'
