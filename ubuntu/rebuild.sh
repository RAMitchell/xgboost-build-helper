set -e
cd xgboost/build
cmake .. -DUSE_CUDA=ON -DCMAKE_CONFIGURATION_TYPES="Debug" -DGTEST_ROOT=../gtest/
make -j4
cd ..
cd python-package/
python setup.py install
cd ..
