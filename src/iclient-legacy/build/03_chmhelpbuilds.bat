@echo off
call setPath.bat

echo ���� "chmdoc.hhp" �� chmdoc������hhc��hhk��hhp...
copy assist\chmdoc.hhp chmdoc\ /y
chmdoc.FarRun

echo ���� "hhc.exe" �� chmdoc...
copy assist\hhc.exe chmdoc\ /y

echo �޸�chmĿ¼������...
hhc_hhk_modify.exe

del chmdoc\_errorlog.txt

echo ����chm...
chmdoc\hhc.exe chmdoc\chmdoc.hhp

copy "chmdoc\SuperMap iClient for JavaScript Help.chm" %chmSavePath% /y
del chmdocLogfile.txt
rd /s /q chmdoc






