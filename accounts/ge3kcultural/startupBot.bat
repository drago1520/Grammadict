@echo off
REM Wait for 15 seconds
timeout /t 40 /nobreak

:connect
REM Attempt to connect using adb
adb connect localhost:21503 > tmp.txt 2>&1

REM Check if the connection was successful or if it needs to retry
findstr /C:"cannot connect to 127.0.0.1:21503: No connection could be made because the target machine actively refused it. (10061)" tmp.txt
if %errorlevel%==0 (
    echo Connection failed, retrying...
    goto connect
) else (
    echo Connection successful.
)

REM Proceed with the rest of the script
cd /d C:\Users\dari\Desktop\projects\GrammAddict
expect -c "spawn python run.py --config accounts/ge3kcultural/follow.yml
expect \"WARNING | If you press ENTER, you are aware of this and will not ask for support in case of a crash.\"
send \"\r\"
expect \"Second prompt text\"
send \"yes\r\"
interact"

REM Cleanup temporary file
del tmp.txt

REM Keep the window open
:loop
echo Script completed. Press CTRL+C to exit.
timeout /t -1
goto loop
