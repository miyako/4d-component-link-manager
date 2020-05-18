//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$ctx)
C_COLLECTION:C1488($2;$params)

$ctx:=$1
$params:=$2

If (Not:C34($ctx.updateNow))
	$ctx.updateNow:=((Milliseconds:C459-$ctx.start)>$ctx.interval)
End if 

If ($ctx.updateNow)
	
	$ctx.updateNow:=False:C215
	$ctx.start:=Milliseconds:C459
	
	$link_manager:=link_manager 
	
	C_OBJECT:C1216($param)
	For each ($param;$params)
		$ctx.port:=$param.port
		$status:=$link_manager.scan($param;$ctx.formula;$ctx)
	End for each 
	
Else 
	DELAY PROCESS:C323(Current process:C322;$ctx.delay)
End if 

If ($ctx.tag="origin")
	CALL WORKER:C1389(Current process name:C1392;Current method name:C684;$ctx;$params)
End if 