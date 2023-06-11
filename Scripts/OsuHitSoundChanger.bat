@echo off
pushd %~dp0
setlocal enabledelayedexpansion

if not exist ..\DefaultHitSoundBackup\ (
  md ..\DefaultHitSoundBackup
  for /f "usebackq" %%f in (`dir /b ..\ ^| findstr /r /g:hitsounds.list`) do (
    copy ..\%%f ..\DefaultHitSoundBackup\%%f >nul
  )
)

:SelectHitSound
cls
set dirname=
for %%f in (..\Scripts) do set dirname=%%~dpf
echo [Now location] :%dirname%
echo;
echo ~Select hit sound~
set i=0
for /d %%f in (..\HitSounds\*) do (
  set /a i=i+1
  echo !i!.%%~nf
)
echo;
echo 0.default hit sound
echo q.Exit program

set /p whichHitSound=">"

set flag=false
if %whichHitSound% == q (
  goto :EndProgram
)
if %whichHitSound% gtr %i% (
  goto :SelectHitSound
)

set i=1
set hitSoundPath=..\DefaultHitSoundBackup
for /d %%f in (..\HitSounds\*) do (
  if %whichHitSound% == !i! (
    set hitSoundPath="%%f"
  )
  set /a i=i+1
)

for /f "usebackq" %%f in (`dir /b ..\ ^| findstr /r /g:hitsounds.list`) do (
  del ..\%%f >nul
)

for %%f in (%hitSoundPath%\*) do (
  copy "%%f" ..\ >nul
)

:EndProgram
endlocal
popd
pause
