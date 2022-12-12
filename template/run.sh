#!/bin/sh

docker run --rm -it \
	-u $(id -u $USER) \
	-w="/home/$USER/colcon_ws" \
	--mount type=bind,src=/etc/passwd,dst=/etc/passwd,ro \
	--mount type=bind,src=/etc/group,dst=/etc/group,ro \
	--mount type=bind,src=/etc/shadow,dst=/etc/shadow,ro \
	--mount type=bind,src=`pwd`/colcon_ws,dst=/home/$USER/colcon_ws \
	--mount type=bind,src=`pwd`/.ros,dst=/home/$USER/.ros \
	--mount type=bind,src=`pwd`/.cache,dst=/home/$USER/.cache \
	--mount type=bind,src=`pwd`/.local,dst=/home/$USER/.local \
	--privileged -v /dev:/dev \
	microros_ws_humble /bin/bash -c "source /opt/ros/humble/setup.bash && /bin/bash"
