@echo off
REM Wait for 15 seconds
timeout /t 15

REM Connect to the device using adb
adb connect localhost:21503

REM Change directory to your project folder and run the Python script
cd /d C:\Users\dari\Desktop\projects\GrammAddict
python run.py --config accounts/ge3kcultural/likeAndWatch.yml

REM Prevent the script from closing
:loop
echo Script completed. Press CTRL+C to exit.
timeout /t -1
goto loop
