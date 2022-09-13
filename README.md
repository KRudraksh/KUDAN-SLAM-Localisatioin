# How to use kdlidar_ros node with kitti #
This is the ROS implementation of Kudan LiDAR SLAM (KdLidar) library.

## Quick start ##

### Setup kdlidar_ros ###
1. Install ROS
  1. ROS Melodic (Ubuntu 18.04)
  ```sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80--recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
  sudo apt update
  sudo apt install ros-melodic-desktop-full
  sudo rosdep init
  rosdep update
  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
  source ~/.bashrc
  ```

  2. ROS Kinetic (Ubuntu 16.04)
  ```sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
  sudo apt-get update
  sudo apt-get install ros-kinetic-desktop-full
  sudo rosdep init
  rosdep update7 echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
  ```
2. Clone the package and install

```git clone https://github.com/KRudraksh/KUDAN-SLAM-Localisatioin```

Download [this](https://drive.google.com/file/d/1CjpWBeU8Sxwz1KPr8AOd53iQxY7wIQz9/view?usp=sharing) file from Google drive and copy to ```/home/{deice-name}/KUDAN-SLAM-Localisatioin/install/lib/kdlidar_ros/```

```source kdlidar_ros/install/setup.bash```

### Map making mode ###
3. Launch kdlidar_ros_pcl node
```source /path/to/kdlidar_ros/install/setup.bash
roslaunch kdlidar_ros kdlidar_ros_pcl_nissan_mapper.launch
```

4. Open a new terminal and ```rosbag play``` kdlidar_ros might skip frames so please add ```-r 0.5``` to play a rosbag file with
x0.5 speed

```rosbag play /path/to/kudan_input_filt_2020-09-09-15-26-12.bag -r 0.5```

5. Open another terminal and save map
```source /path/to/kdlidar_ros/install/setup.bash
rosservice call /kdlidar_ros_pcl/save_map nissan.kdlm
```

You can replace "nissan.kdmp" with any file name you want. The file will be saved at ROS_HOME which is by default ~/.ros
Note that you need to source your catkin workspace in your terminal in order for the services to become available.

### Launch kdlidar_ros_pcl node ###
#### KITTI dataset ####
1. Download a sample bag file
You can download kitti_2011_10_03_drive_0027_synced.bag from [here](https://www.dropbox.com/sh/faojt9bohpgwfww/AAA_aAQnnvRO70OjFPs7Pgaza?dl=0)

2. Launch kdlidar_ros_pcl node

```roslaunch kdlidar_ros kdlidar_ros_pcl_kitti.launch```

3. Open a new terminal and rosbag play

```rosbag play /path/to/kitti_2011_10_03_drive_0027_synced.bag -r 0.5```

### Save map ###
To save the map with a simple command line command run one the commands
(matching to your node running):

```rosservice call /kdlidar_ros_xxx/save_map path/to/map.kdlm```

You can replace "map.kdmp" with any file name you want. The file will be saved at ROS_HOME which is by default ~/.ros
Note that you need to source your catkin workspace in your terminal in order for the services to become available.
