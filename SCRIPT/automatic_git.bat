@echo off
REM %DATE:~0,10%  2020/08/06
set dd=%DATE:~0,10%
set tt=%time:~0,8%
REM change file directory
E:
cd E:\STUDY\SCRIPT
REM start git script 
git pull origin master
git status
git add .
git commit -m "%dd:/=-% %tt%"
git push origin master
exit