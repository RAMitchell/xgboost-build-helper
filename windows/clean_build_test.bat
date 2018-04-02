rmdir /s /q xgboost
git clone %1 --recursive
cd xgboost
git checkout %2
mkdir build
cd build
cmake .. -G"Visual Studio 14 2015 Win64" -DUSE_CUDA=ON -DUSE_NCCL=ON -DGPU_COMPUTE_VER="61" 
"%ProgramFiles(x86)%\MSBuild\14.0\Bin\MSBuild.exe" xgboost.sln /p:Configuration=Release
cd ..
set PYTHONPATH=%cd%\python-package
python -m nose --attr=!slow tests/python-gpu/
