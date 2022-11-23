del /f /Q /S Receiver_linux64.zip
del /f /Q /S "Build\linux64"

"%UNITY_HUB%/Editor/2021.3.13f1/Editor/Unity.exe" -quit -batchmode -projectPath "%~dp0" -executeMethod ReceiverBuildScript.BuildLinux64 -logFile unitylog.txt

if errorlevel 1 (
    echo Failure To Run
    exit /b %errorlevel%
)

cd Build/linux64
7z a -tzip ../../Receiver_linux64.zip ./
cd ../..
