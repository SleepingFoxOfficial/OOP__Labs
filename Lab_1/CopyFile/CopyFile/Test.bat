set PROGRAM="%~1"

%PROGRAM% TestData\empty.txt %TEMP%\empty.txt 
if ERRORLEVEL 1 goto err
fc.exe %TEMP%\empty.txt TestData\empty.txt 
if ERRORLEVEL 1 goto err

%PROGRAM% TestData\one-line.txt %TEMP%\one-line.txt 
if ERRORLEVEL 1 goto err
fc.exe %TEMP%\one-line.txt TestData\one-line.txt 
if ERRORLEVEL 1 goto err
                              
%PROGRAM% TestData\more100simbols.txt TestData\more100simbolsout.txt 
if ERRORLEVEL 1 goto err
fc.exe TestData\more100simbolst.txt TestData\more100simbolsout.txt 
if ERRORLEVEL 1 goto err

%PROGRAM% TestData\multiline.txt TestData\multilineout.txt 
if ERRORLEVEL 1 goto err
fc.exe TestData\multilinet.txt TestData\multilineout.txt 
if ERRORLEVEL 1 goto err

%PROGRAM% TestData\non-existing-file-name.txt %TEMP%\non-existing-file-name.txt > "%TEMP%\output.txt" 
if NOT ERRORLEVEL 1 goto err
fc.exe "%TEMP%\output.txt" TestData\expected-output-when-input-file-is-missing.txt 
if ERRORLEVEL 1 goto err

%PROGRAM% TestData\multiline.txt %PROGRAM% > %TEMP%\output.txt 
if NOT ERRORLEVEL 1 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1