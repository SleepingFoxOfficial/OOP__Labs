rem %1 - �������� ������� ��������� ��������� ������ bat-����� (����� �� ����)
rem %~1 - �������� ������� ��������� ��������� ������ bat-����� � ��������� ����������� ������� (���� ��� ����)

rem ���������� PROGRAM ����� ������� ������ �������� ��������� ������ ����������� � �������
set PROGRAM="%~1"

rem ��� ������� ��� ���������� ��������� ��������� ��� ��������
%PROGRAM% > nul
if NOT ERRORLEVEL 1 goto err

rem ��� ������� � ����������� �����������, �� � �������������� �������
%PROGRAM% NOtCreationFileIn.txt "%TEMP%\fox.txt" bird cat
if NOT ERRORLEVEL 1 goto err

rem ��� ������� � ����������� ����������� ��������� ������� ��� ��������
%PROGRAM% TestData\fox.txt "%TEMP%\fox.txt" bird cat
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\fox.txt" TestData\fox.txt >nul
if ERRORLEVEL 1 goto err

rem ��� ������� � ����������� ����������� ��������� ������� ��� ��������
%PROGRAM% TestData\fox.txt "%TEMP%\fox.txt" dog cat
if ERRORLEVEL 1 goto err
fc.exe "%TEMP%\fox.txt" TestData\fox-replace-dog-with-cat.txt >nul
if ERRORLEVEL 1 goto err

echo OK
exit 0

:err
echo Program testing failed
exit 1