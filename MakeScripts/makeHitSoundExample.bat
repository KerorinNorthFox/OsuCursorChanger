@echo off
pushd %~dp0
setlocal enabledelayedexpansion

if not exist ..\HitSoundExample\ (
  md ..\HitSoundExample
  for /f "usebackq" %%f in (`dir /b ..\ ^| findstr /r /g:hitsounds.list`) do (
    copy ..\%%f ..\HitSoundExample\%%f >nul
  )
)

endlocal
popd
exit /b
