set PROGRAM="%~1"

rem invalid arguments  
%PROGRAM% > "%TEMP%\output.txt"
if NOT ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\InvalidArguments.txt
if ERRORLEVEL 1 goto err                 
                                                                                                                          
rem invalid value 256 
%PROGRAM% "256" > "%TEMP%\output.txt"
if NOT ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\InvalidValue.txt
if ERRORLEVEL 1 goto err                  

rem invalid value -1
%PROGRAM% "-1" > "%TEMP%\output.txt"
if NOT ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\InvalidValue.txt
if ERRORLEVEL 1 goto err                

rem string value
%PROGRAM% "it is string" > "%TEMP%\output.txt"
if NOT ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\InvalidValue.txt
if ERRORLEVEL 1 goto err          

rem flip byte 6
%PROGRAM% "6" > "%TEMP%\output.txt"
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\Value6.txt 
if ERRORLEVEL 1 goto err           

rem flip byte 0
%PROGRAM% "0" > "%TEMP%\output.txt"
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\Value0.txt 
if ERRORLEVEL 1 goto err

rem flip byte 255
%PROGRAM% "255" > "%TEMP%\output.txt"
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" Testdata\Value255.txt 
if ERRORLEVEL 1 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1