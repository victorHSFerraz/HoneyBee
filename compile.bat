@echo off

REM Flutter clean
call flutter clean

REM Flutter pub get
call flutter pub get

REM Flutter build runner
call flutter pub run build_runner build --delete-conflicting-outputs

echo All tasks completed!
pause