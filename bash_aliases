alias refresh="source ~/.bashrc"

function cmk()
{
    dir=$PWD
    cd ~/catkin_ws
    catkin_make $@
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

