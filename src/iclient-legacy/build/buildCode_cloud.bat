::�ϲ��ļ�
for /f %%i in (filelists_cloud.txt) do type %%i >> SuperMap-debug-cloud.js

:: ����ѹ��
java -jar ../tools/compressor/yuicompressor-2.4.2.jar --type js --charset utf-8 -o ../tools/compressor/SuperMap_Cloud.js SuperMap-debug-cloud.js 
 ::ɾ���ϲ�����ļ�
del SuperMap-debug-cloud.js /f /q

::ɾ��Դ���е��ļ�
del "../libs/SuperMap_Cloud.js" /f /q

::���л�������
CScript /nologo ../tools/compressor/pack.wsf ../tools/compressor/SuperMap_Cloud.js >> ../tools/compressor/SuperMap_compress_cloud.js

cd /d ../tools/compressor
for /f %%i in (compress_cloud.txt) do type %%i >> ../../libs/SuperMap_Cloud.js

::ɾ��ѹ������ļ�
del SuperMap_Cloud.js
del SuperMap_compress_cloud.js

::ת����ʽΪUTF-8
dir "..\..\libs\SuperMap_Cloud.js" /A-D /B /S > encode.log
for /f %%i in (encode.log) do (  
    CScript /nologo encode.vbs %%i utf-8  
)
del encode.log

