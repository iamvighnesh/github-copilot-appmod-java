@echo off
REM Batch script to execute Sybase stored procedure using isql

REM Set Sybase connection details
SET SYBASE_SERVER=localhost
SET SYBASE_DATABASE=testdb
SET SYBASE_USER=sa
SET SYBASE_PASSWORD=myPassword

REM Execute the stored procedure SQL file using isql (Sybase command-line tool)
isql -S %SYBASE_SERVER% -D %SYBASE_DATABASE% -U %SYBASE_USER% -P %SYBASE_PASSWORD% -i stored-procedure.sql -o stored-procedure-output.log

IF %ERRORLEVEL% EQU 0 (
    echo Stored procedure created successfully!
    echo Output saved to stored-procedure-output.log
) ELSE (
    echo Error creating stored procedure. Check stored-procedure-output.log for details.
)

pause
