@echo off
call setPath.bat

::����apidoc�ļ����µ����ݵ�chmdoc...
if exist chmdoc (rd /s /q chmdoc) 
md chmdoc
xcopy %apidoc_Path%\apidoc chmdoc\ /s /y
del chmdoc\index.html
rd /s /q chmdoc\index
rd /s /q chmdoc\search
ren chmdoc\files api

::������ҳ����Ʒ���ܡ�����ָ�ϡ�ר�����ҳ��...
md "chmdoc\SuperMap iClient 8C for JavaScript"
copy %Transformers10_Path%\Transformers10\index.html "chmdoc\SuperMap iClient 8C for JavaScript\" /y
copy %Transformers10_Path%\Transformers10\examples\intro.html "chmdoc\SuperMap iClient 8C for JavaScript\" /y
copy %Transformers10_Path%\Transformers10\examples\developGuide.html "chmdoc\SuperMap iClient 8C for JavaScript\" /y

md "chmdoc\ר�����"
copy %Transformers10_Path%\Transformers10\examples\dyncSegmentationTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\mobileTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\rendererTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\Win8AppTopic.html "chmdoc\ר�����\" /y

copy %Transformers10_Path%\Transformers10\examples\HeatMapLayerTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\ClusterLayerTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\HeatGridLayerTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\UTFGridLayerTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\GOISTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\ElementsTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\TileVectorTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\AnimatorTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\ThemeLayerGraphTopic.html "chmdoc\ר�����\" /y
copy %Transformers10_Path%\Transformers10\examples\PlottingTopic.html "chmdoc\ר�����\" /y

md chmdoc\examples
md chmdoc\examples\css
echo copy css...
xcopy %Transformers10_Path%\Transformers10\examples\css chmdoc\examples\css\ /q /s /y

md chmdoc\examples\images
echo copy images...
xcopy %Transformers10_Path%\Transformers10\examples\images chmdoc\examples\images\ /q /s /y
copy assist\GettingStarted.png chmdoc\examples\images\ /y

md chmdoc\examples\js
echo copy "jquery.js" to js...
copy %Transformers10_Path%\Transformers10\examples\js\jquery.js chmdoc\examples\js\ /y

xcopy chmdoc\examples "chmdoc\SuperMap iClient 8C for JavaScript\" /q /s /y
xcopy chmdoc\examples "chmdoc\ר�����\" /q /s /y

rd /s /q chmdoc\examples



