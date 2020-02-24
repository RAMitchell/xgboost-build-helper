set -e
rm -rf xgboost

#Repo
branch="master"
if [ "$2" != "" ]; then
	branch="$2"
fi

if [ "$1" != "" ]; then
        git clone $1 --recursive
else
        git clone https://github.com/RAMitchell/xgboost.git --recursive
fi
cd xgboost
#Branch
if [ "$2" != "" ]; then
        git checkout $2
fi
git submodule update --recursive
#cmake
mkdir build && cd build
cmake .. -DUSE_CUDA=ON  -DGOOGLE_TEST=ON -DUSE_DMLC_GTEST=ON  -DUSE_NCCL=ON -DNCCL_ROOT=$PWD/../../nccl/build
make -j
cd ..
pytest -v -s --fulltrace -m "(not slow)" tests/python-gpu
cd build
testxgboost
cd ..
cd tests/distributed
./runtests-gpu.sh
