@echo off
pushd %~dp0
setlocal enabledelayedexpansion

rem move Cursor files for backup if DefaultCursorBackup does not exist.
if not exist ..\DefaultCursorBackup\ (
  md ..\DefaultCursorBackup
  for %%f in (..\cursor*png) do (
    copy %%f ..\DefaultCursorBackup\%%~nf.png >nul
  )
)

rem select Cursor
:SelectCursor
cls
set dirname=
for %%f in (..\Scripts) do set dirname=%%~dpf
echo [Now location] :%dirname%
echo;
echo ~Select cursor~
set i=0
for /d %%f in (..\Cursors\*) do (
  set /a i=i+1
  echo !i!.%%~nf
)
echo;
echo 0.default cursor
echo q.Exit program

set /p whichCursor=">"

rem check if it's whthin range.
set flag=false
if %whichCursor% == q (
  goto :EndProgram
)
if %whichCursor% gtr %i% (
  goto :SelectCursor
)

rem set Cursor directory path
set i=1
set cursorPath=..\DefaultCursorBackup
for /d %%f in (..\Cursors\*) do (
  if %whichCursor% == !i! (
    set cursorPath="%%f"
  )
  set /a i=i+1
)

for %%f in (..\cursor*png) do (
  del %%f >nul
)

for %%f in (%cursorPath%\cursor*) do (
  copy "%%f" ..\ >nul
)

:EndProgram
endlocal
popd
pause
