#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/fabi/catkin_ws/src/arbotix_sensors"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/fabi/catkin_ws/install/lib/python2.7/dist-packages:/home/fabi/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/fabi/catkin_ws/build" \
    "/usr/bin/python" \
    "/home/fabi/catkin_ws/src/arbotix_sensors/setup.py" \
    build --build-base "/home/fabi/catkin_ws/build/arbotix_sensors" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/fabi/catkin_ws/install" --install-scripts="/home/fabi/catkin_ws/install/bin"
