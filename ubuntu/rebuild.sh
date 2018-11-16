set -e
cd xgboost/build
cmake .. -DUSE_CUDA=ON -DCMAKE_CONFIGURATION_TYPES="Debug" -DGTEST_ROOT=../gtest/ -DUSE_NCCL=ON -DNCCL_ROOT=$PWD/../nccl
make -j4
cd ..
cd python-package/
python setup.py install
cd ..
