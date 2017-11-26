set -e
# Build gtest via cmake
wget https://github.com/google/googletest/archive/release-1.7.0.zip
unzip release-1.7.0.zip
mv googletest-release-1.7.0 gtest && cd gtest
cmake . && make
mkdir lib && mv libgtest.a lib
cd ..
rm -rf release-1.7.0.zip
