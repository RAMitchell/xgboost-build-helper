set -e
# Build gtest via cmake
wget https://github.com/google/googletest/archive/release-1.10.0.zip
unzip release-1.10.0.zip
mv googletest-release-1.10.0 gtest && cd gtest
cmake . && make
cp -r googletest/include include
cd ..
rm -rf release-1.10.0.zip
