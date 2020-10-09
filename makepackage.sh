RELEASE=release

if [ -d "$RELEASE" ];then
    if [ -d release.bak ];then
        rm -rf release.bak
        mv release release.bak
        mkdir release
    else
        mv release release.bak
        mkdir release
    fi
else
    mkdir release
fi

cd release

mkdir Verde

cd ..

cp -r .vimrc .vim install.sh uninstall.sh release/Verde/

cd release

zip -vr Verde.zip Verde/ -x "*.DS_Store"

rm -rf Verde 

mkdir VerdeMini

cd ..

cp .vimrc_mini release/VerdeMini

cd release

zip -vr VerdeMini.zip VerdeMini/ -x "*.DS_Store"

rm -rf VerdeMini

