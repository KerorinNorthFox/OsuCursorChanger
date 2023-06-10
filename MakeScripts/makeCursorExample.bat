@echo off
pushd %~dp0
setlocal enabledelayedexpansion

rem move Cursor files for backup if CursorExample does not exist.
if not exist ..\CursorExample\ (
  md ..\CursorExample
  for %%f in (..\cursor*png) do (
    copy %%f ..\CursorExample\%%~nf.png >nul
  )
)

endlocal
popd
pause
