@echo off

set distro_name=%%DISTRO_NAME%%
set distro_tarball=.\rootfs.tar

set /p distro_name="Specify the distro name (or press enter to use "%distro_name%"): "
set distro_dest=%USERPROFILE%\WSL2\systems\%distro_name%

:do_prompt
  choice /C YN /M "IF THE '%distro_name%' DISTRO ALREADY EXISTS IT WILL BE REMOVED!!!"
  IF ERRORLEVEL 2 goto do_exit 
  IF ERRORLEVEL 1 goto do_install
  goto do_prompt

:do_install
  wsl --terminate %distro_name% >nul 2>&1
  wsl --unregister %distro_name% >nul 2>&1
  md -p %distro_dest% >nul 2>&1
  wsl --import %distro_name% %distro_dest% %distro_tarball%
  echo Starting %distro_name%...
  wsl -d %distro_name%

:do_exit
  echo Exiting...
  pause
  exit /b
