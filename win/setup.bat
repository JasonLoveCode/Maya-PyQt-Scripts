@echo off

set MAYAVERSION=2016
set ADSKQTVERSION=4.8.6
set SIPVERSION=4.16.7
set PYQTVERSION=4.11.3
set MAYADRIVE=m:
set BUILDDRIVE=v:

if exist %MAYADRIVE%\nul subst %MAYADRIVE% /d
subst %MAYADRIVE% "C:\Program Files\Autodesk\Maya%MAYAVERSION%"
set MAYA_LOCATION=%MAYADRIVE%

set MAYAPYQTBUILD=%~dp0
rem Removing trailing \
set MAYAPYQTBUILD=%MAYAPYQTBUILD:~0,-1%

if exist %BUILDDRIVE%\nul subst %BUILDDRIVE% /d
subst %BUILDDRIVE% "%MAYAPYQTBUILD%"

set SIPDIR=%BUILDDRIVE%\sip-%SIPVERSION%
set PYQTDIR=%BUILDDRIVE%\PyQt-win-gpl-%PYQTVERSION%
rem set ADSKQTDIR=%BUILDDRIVE%\qt-%ADSKQTVERSION%
set QTDIR=%MAYA_LOCATION%

set PATH=%QTDIR%\bin;%PATH%
set MSVC_VERSION=2012
set MSVC_DIR=C:\Program Files (x86)\Microsoft Visual Studio 11.0
set QMAKESPEC=%QTDIR%\mkspecs\win32-msvc%MSVC_VERSION%
set _QMAKESPEC_=win32-msvc%MSVC_VERSION%

if ["%LIBPATH%"]==[""] call "%MSVC_DIR%\VC\vcvarsall" amd64

set INCLUDE=%INCLUDE%;%MAYA_LOCATION%\include\python2.7
set LIB=%LIB%;%MAYA_LOCATION%\lib
