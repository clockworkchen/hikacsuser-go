@echo off

REM 使用echo命令输出中文
echo [信息] 编译海康威视门禁系统SDK封装程序

REM 设置Go环境变量
set GOOS=windows
set CGO_ENABLED=1

REM 设置CGO链接器标志
set CGO_LDFLAGS=-LD:/workspace/hikacsuser-go/lib/win64 -lHCNetSDK -lHCCore -lPlayCtrl
set CGO_CFLAGS=-ID:/workspace/hikacsuser-go/lib/win64

REM 如果不存在bin目录，创建它
if not exist bin mkdir bin

REM 编译SDK库
cd internal\sdk
go build -o ..\..\bin\sdk.a -buildmode=archive
if %ERRORLEVEL% NEQ 0 (
    echo [错误] SDK编译失败
    exit /b %ERRORLEVEL%
)
cd ..\..\bin

REM 复制动态库和资源文件
xcopy /Y ..\lib\win64\*.dll .\
xcopy /Y ..\lib\win64\HCNetSDKCom\*.dll .\HCNetSDKCom\

REM 复制并更新配置文件，禁用端口映射
echo ^<?xml version="1.0" encoding="GB2312"?^> > HCNetSDK_Log_Switch.xml
echo ^<SdkLocal^> >> HCNetSDK_Log_Switch.xml
echo     ^<SdkLog^> >> HCNetSDK_Log_Switch.xml
echo         ^<logLevel^>3^</logLevel^> >> HCNetSDK_Log_Switch.xml
echo         ^<logDirectory^>./sdklog/^</logDirectory^> >> HCNetSDK_Log_Switch.xml
echo         ^<autoDelete^>true^</autoDelete^> >> HCNetSDK_Log_Switch.xml
echo     ^</SdkLog^> >> HCNetSDK_Log_Switch.xml
echo     ^<!-- 禁用端口映射 --^> >> HCNetSDK_Log_Switch.xml
echo     ^<Net^> >> HCNetSDK_Log_Switch.xml
echo         ^<TransUse^>false^</TransUse^> >> HCNetSDK_Log_Switch.xml
echo     ^</Net^> >> HCNetSDK_Log_Switch.xml
echo ^</SdkLocal^> >> HCNetSDK_Log_Switch.xml

REM 编译主程序
cd ..\cmd\acsdemo
go build -o ..\..\bin\acsdemo.exe
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 主程序编译失败
    exit /b %ERRORLEVEL%
)
cd ..\..\bin

REM 创建资源目录
if not exist resources mkdir resources
if not exist resources\pic mkdir resources\pic
xcopy /Y ..\resources\pic\*.jpg resources\pic\

echo [信息] 编译完成，程序已保存到bin目录

REM 询问是否运行程序
set /p run=[提示] 是否运行程序(y/n)?
if /i "%run%"=="y" (
    acsdemo.exe
)