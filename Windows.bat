@echo off
cls
:admchk
echo Checking for Administrative permissions
net sessions
if %errolevel%==0 (
echo You have Administrative permissions 
goto :adminhop
) else (
echo Please open as Administrator
pause
exit
)
:adminhop
echo Running password policies
net accounts /minpwlen:9 /maxpwage:20 /uniquepw:1 /lockoutduration:30 /lockoutthreshold:5
echo password policies have been configured 
echo minimum password lenght = 9
echo maximum password age = 20
echo unique password = 1
echo lockout duration = 30 minutes
echo lockout threshold = 5
pause
