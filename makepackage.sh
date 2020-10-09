RELEASE=release

if [ -d "$RELEASE" ];then
    echo "release directory found"
else
    mkdir release
fi

cp -r .vimrc .vim install.sh uninstall.sh release/

