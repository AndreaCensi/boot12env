
echo "Are you sure you want usrpyplus?"
source ~/scm/usrpyplus.sh 


alias boot_gui_osx='/usr/bin/pythonw =boot_gui'

source ~/bin/ros_install_env.sh 
export ROS_PACKAGE_PATH=${B11_SRC}/bootstrapping_olympics/ros-packages:${ROS_PACKAGE_PATH}

# Make sure we can access local packages even though we use another python
# (e.g. python26 for ros)

export PYTHONPATH=${B11_PREFIX}/lib/python2.6/site-packages:$PYTHONPATH
