@echo off
pushd %~dp0
setlocal enabledelayedexpansion

rem move Cursor files for backup if DefaultCursorBackup does not exist.
if not exist ..\DefaultCursorBackup\ (
  md ..\DefaultCursorBackup
  for /f "usebackq" %%f in (`dir /b ..\ ^| find "cursor"`) do (
    echo "%%f" | find ".png" >nul
    if not ERRORLEVEL 1 (
      echo %%f
      copy ..\%%f ..\DefaultCursorBackup\%%f >nul
    )
  )
)

rem select Cursor
:SelectCursor
cls
echo ^>Select cursor
set i=0
for /d %%f in (..\Cursors\*) do (
  set /a i=i+1
  echo !i!.%%~nf
)
echo 0.default cursor
echo q.Exit program

set /p whichCursor=">"

rem check if it's whthin range.
set flag=false
if %whichCursor% == q (
  goto :EndProgram
)
if %whichCursor% gtr %i% (
  set flag=true
)
if %flag% == true (
  goto :SelectCursor
)

rem set Cursor directory path
set i=1
set cursorPath=..\DefaultCursorBackup
for /d %%f in (..\Cursors\*) do (
  if %whichCursor% == !i! (
    set cursorPath=%%f
  )
  set /a i=i+1
)

for /f "usebackq" %%f in (`dir /b ..\ ^| find "cursor"`) do (
  echo "%%f" | find ".png" >nul
  if not ERRORLEVEL 1 (
    del ..\%%f >nul
  )
)

for %%f in (%cursorPath%\*) do (
  copy %%f ..\ >nul
)

:EndProgram
endlocal
popd
pause
