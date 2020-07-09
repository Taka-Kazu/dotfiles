alias refresh="source ~/.bashrc"

function cmk()
{
    dir=$PWD
    cd ~/catkin_ws
    catkin build $@ -DCMAKE_BUILD_TYPE=Release
    cd $dir
}

function search()
{
  grep $@ -rnC 1 .
}

function format_c()
{
  find $@ -name "*.h" | xargs clang-format -style=file -i
  find $@ -name "*.c" | xargs clang-format -style=file -i
  find $@ -name "*.hpp" | xargs clang-format -style=file -i
  find $@ -name "*.cpp" | xargs clang-format -style=file -i
}

alias git_log="git log --all --graph --decorate"

function cb()
{
    dir=$PWD
    cd ~/ros2_ws
    if [ $# -gt 0 ]; then
        colcon build --packages-select $1 --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
    else
        colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
    fi
    . install/local_setup.bash
    cd $dir
}
