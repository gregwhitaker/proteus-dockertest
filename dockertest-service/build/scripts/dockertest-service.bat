@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  dockertest-service startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and DOCKERTEST_SERVICE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\dockertest-service-0.1.0.jar;%APP_HOME%\lib\dockertest-idl-0.1.0.jar;%APP_HOME%\lib\proteus-spring-boot-starter-0.3.2.jar;%APP_HOME%\lib\proteus-spring-boot-autoconfigure-0.3.2.jar;%APP_HOME%\lib\client-0.7.19.jar;%APP_HOME%\lib\core-0.7.19.jar;%APP_HOME%\lib\protobuf-java-3.5.1.jar;%APP_HOME%\lib\spring-boot-starter-2.0.2.RELEASE.jar;%APP_HOME%\lib\frames-0.7.19.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\rsocket-transport-netty-0.11.3.jar;%APP_HOME%\lib\rsocket-core-0.11.3.jar;%APP_HOME%\lib\micrometer-core-1.0.4.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.0.2.RELEASE.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\log4j-to-slf4j-2.10.0.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.25.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.0.2.RELEASE.jar;%APP_HOME%\lib\validation-api-2.0.1.Final.jar;%APP_HOME%\lib\spring-boot-2.0.2.RELEASE.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\spring-context-5.0.6.RELEASE.jar;%APP_HOME%\lib\spring-aop-5.0.6.RELEASE.jar;%APP_HOME%\lib\spring-beans-5.0.6.RELEASE.jar;%APP_HOME%\lib\spring-expression-5.0.6.RELEASE.jar;%APP_HOME%\lib\spring-core-5.0.6.RELEASE.jar;%APP_HOME%\lib\snakeyaml-1.19.jar;%APP_HOME%\lib\auth-0.7.19.jar;%APP_HOME%\lib\reactor-netty-0.7.7.RELEASE.jar;%APP_HOME%\lib\netty-handler-4.1.24.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.24.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.24.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.24.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.24.Final.jar;%APP_HOME%\lib\netty-codec-4.1.24.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.24.Final.jar;%APP_HOME%\lib\netty-transport-4.1.24.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.24.Final.jar;%APP_HOME%\lib\reactor-extra-3.1.6.RELEASE.jar;%APP_HOME%\lib\reactor-core-3.1.7.RELEASE.jar;%APP_HOME%\lib\HdrHistogram-2.1.10.jar;%APP_HOME%\lib\LatencyUtils-2.0.3.jar;%APP_HOME%\lib\config-1.3.2.jar;%APP_HOME%\lib\guava-22.0.jar;%APP_HOME%\lib\spring-jcl-5.0.6.RELEASE.jar;%APP_HOME%\lib\netty-resolver-4.1.24.Final.jar;%APP_HOME%\lib\netty-common-4.1.24.Final.jar;%APP_HOME%\lib\reactive-streams-1.0.2.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\log4j-api-2.10.0.jar

@rem Execute dockertest-service
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %DOCKERTEST_SERVICE_OPTS%  -classpath "%CLASSPATH%" com.netifi.proteus.dockertest.service.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable DOCKERTEST_SERVICE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%DOCKERTEST_SERVICE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
