FROM ubuntu:focal

LABEL maintainer="nomumu <nomumu-github@koso2-dan.ddo.jp>"

RUN apt-get update -y && apt-get install -y apt-utils
RUN apt-get update -y && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 
RUN apt-get update -y && apt-get install -y locales curl gnupg2 lsb-release
RUN apt-get update -y && apt-get install -y curl gnupg2 lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt-get update -y && apt-get install -y ros-foxy-ros-base python3-rosdep
RUN apt-get update -y && apt-get install -y vim git sudo zsh 
RUN apt-get update -y && apt-get install -y flex libasio-dev libcurl4-openssl-dev clang-tidy python3-vcstool bison libncurses5-dev usbutils
RUN apt-get update -y && apt-get install -y libpython3-dev python3-pip && pip3 install -U argcomplete

RUN apt-get update -y && apt-get install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget
RUN python3 -m pip install -U \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest
RUN apt-get update -y && apt-get install --no-install-recommends -y libasio-dev libtinyxml2-dev
RUN apt-get update -y && apt-get install --no-install-recommends -y libcunit1-dev

RUN apt-get update -y && apt-get install --no-install-recommends -y clang-format python3-mypy python3-pytest-mock python3-nose gperf python3-venv

RUN /bin/bash -c "source /opt/ros/foxy/setup.bash" && rosdep init

RUN echo "Defaults visiblepw" >> /etc/sudoers

CMD echo 'Create micro-ROS workspace docker'
