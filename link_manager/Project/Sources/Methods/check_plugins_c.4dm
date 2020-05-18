//%attributes = {"invisible":true,"preemptive":"incapable"}
C_OBJECT:C1216($1;$signal)
C_COLLECTION:C1488($2;$REQUIRED_PLUGINS)
C_OBJECT:C1216($0;$status)

$signal:=$1
$REQUIRED_PLUGINS:=$2

C_BOOLEAN:C305($isReady)
$isReady:=False:C215

ARRAY LONGINT:C221($numbers;0)
ARRAY TEXT:C222($names;0)

PLUGIN LIST:C847/*not thread safe*/($numbers;$names)

$plugins:=New collection:C1472
ARRAY TO COLLECTION:C1563($plugins;$names)

C_TEXT:C284($plugin)

For each ($plugin;$REQUIRED_PLUGINS) Until (Not:C34($isReady))
	
	$isReady:=($plugins.indexOf($plugin)#-1)
	
End for each 

If (Not:C34(Process aborted:C672))
	
	Use ($signal)
		
		$signal.isReady:=$isReady
		
	End use 
	
	$signal.trigger()
	
End if 

KILL WORKER:C1390