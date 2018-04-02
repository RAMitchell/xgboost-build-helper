set -e
cd xgboost/build
cmake .. -DUSE_CUDA=ON -DUSE_AVX=ON -DCMAKE_CONFIGURATION_TYPES="Debug"
make -j4
cd ..
cd python-package/
python setup.py install
cd ..
