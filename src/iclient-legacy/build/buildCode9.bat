::���ɷֿ�txt�ļ�,Դ����·��jChmBuild_source\createPackageFilelists.rar
createPackageFilelists.exe

::�ϲ��ļ�
for /f %%i in (SuperMap.txt) do type %%i >> SuperMap-debug.js
for /f %%i in (filelists.txt) do type %%i >> SuperMap-debug2.js


::ɾ���ֿ��txt�ļ�
if exist SuperMap_basic.txt ( del SuperMap_basic.txt) 
if exist SuperMap_cloud.txt ( del SuperMap_cloud.txt)
if exist SuperMap_OGC.txt ( del SuperMap_OGC.txt)
if exist SuperMap_iServer.txt ( del SuperMap_iServer.txt) 
if exist SuperMap_visualization.txt ( del SuperMap_visualization.txt) 

:: ����ѹ��
java -jar ../tools/compressor/yuicompressor-2.4.2.jar --type js --charset utf-8 -o ../tools/compressor/SuperMap.js SuperMap-debug.js 
java -jar ../tools/compressor/yuicompressor-2.4.2.jar --type js --charset utf-8 -o ../tools/compressor/SuperMap2.js SuperMap-debug2.js 





::ɾ��Դ���е��ļ�
del "..\..\SuperMap.js" /f /q


::���л�������
CScript /nologo ../tools/compressor/pack.wsf ../tools/compressor/SuperMap.js >> ../tools/compressor/SuperMap_compress.js
CScript /nologo ../tools/compressor/pack.wsf ../tools/compressor/SuperMap2.js >> ../tools/compressor/SuperMap_compress2.js


cd /d ../tools/compressor
for /f %%i in (compress.txt) do type %%i >> ../../../SuperMap.js



::ɾ��ѹ������ļ�
del SuperMap.js
del SuperMap2.js

del SuperMap_compress.js
del SuperMap_compress2.js


::ת����ʽΪUTF-8
dir "..\..\..\SuperMap.js" /A-D /B /S > encode.log
for /f %%i in (encode.log) do (  
    CScript /nologo encode.vbs %%i utf-8  
)
del encode.log

