set -e
rm -rf xgboost
#Repo
branch="master"
if [ "$2" != "" ]; then
	branch="$2"
fi

if [ "$1" != "" ]; then
        git clone -b $branch $1 --recursive
else
        git clone https://github.com/RAMitchell/xgboost.git --recursive
fi
cd xgboost
#Branch
if [ "$2" != "" ]; then
        git checkout $2
fi
sh ../build_gtest.sh
#cmake
mkdir build && cd build
cmake .. -DUSE_CUDA=ON -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -DGOOGLE_TEST=ON -DGTEST_ROOT=../gtest/
make -j4
cd ..
cd python-package/
python setup.py install
cd ..
python -m nose tests/python-gpu
testxgboost
