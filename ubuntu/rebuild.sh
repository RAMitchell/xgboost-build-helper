set -e
cd xgboost/build
cmake .. -DUSE_CUDA=ON -DCMAKE_BUILD_TYPE=Debug -DGOOGLE_TEST=ON -DGTEST_ROOT=$PWD/../gtest   -DUSE_NCCL=ON -DNCCL_ROOT=$PWD/../nccl -DGPU_COMPUTE_VER=70
make -j
cd ..
