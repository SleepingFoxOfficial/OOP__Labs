rem %1 - значение первого аргумента командной строки bat-файла (какой он есть)
rem %~1 - значение первого аргумента командной строки bat-файла с удалением обрамляющих кавычек (если они были)

rem Переменная PROGRAM будет хранить первый аргумент командной строки заключённый в кавычки
set PROGRAM="%~1"

rem При запуске без параметров ожидается ненулевой код возврата
%PROGRAM% > nul
if NOT ERRORLEVEL 1 goto err
echo "11"

rem При запуске с правильными параметрами, но с неоткрывшимися файлами
%PROGRAM% NotCreateFileIn.txt "%TEMP%\fox.txt" bird cat
if NOT ERRORLEVEL 1 goto err
echo "22"

rem При запуске с правильными параметрами, но искомая строка пустая
rem %PROGRAM% TestData\fox.txt "%TEMP%\fox.txt" "" cat
rem if NOT ERRORLEVEL 1 goto err
rem echo "33"

rem При запуске с правильными параметрами ожидается нулевой код возврата
%PROGRAM% TestData\fox.txt "%TEMP%\fox.txt" bird cat
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\fox.txt" TestData\fox.txt >nul
if ERRORLEVEL 1 goto err
echo "44"

rem При запуске с правильными параметрами ожидается нулевой код возврата
%PROGRAM% TestData\fox.txt "%TEMP%\fox.txt" dog cat
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\fox.txt" TestData\fox-replace-dog-with-cat.txt >nul
if ERRORLEVEL 1 goto err
echo "55"


echo OK
exit 0

:err
echo Program testing failed
exit 1