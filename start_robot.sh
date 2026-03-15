#!/bin/bash
source /opt/ros/jazzy/setup.bash
source /home/kali/Documents/CubicDoggo/install/setup.bash
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export QT_QPA_PLATFORM=xcb
(
    sleep 2
    ros2 topic pub -1 /leg_set_named example_interfaces/msg/String "{data: 'stand'}"
    sleep 2
    ros2 topic pub -1 /leg_set_named example_interfaces/msg/String "{data: 'stand'}"
    sleep 2
    ros2 service call /leg_walk_toggle std_srvs/srv/SetBool "{data: true}"
    sleep 2
    ros2 service call /leg_walk_toggle std_srvs/srv/SetBool "{data: false}"
    sleep 2
    ros2 topic pub -1 /leg_set_named example_interfaces/msg/String "{data: 'stand'}"
    sleep 2
    ros2 topic pub -1 /leg_set_named example_interfaces/msg/String "{data: 'rest'}"
) &
ros2 launch my_robot_bringup cubic_doggo.with_lifecycle.launch.py



