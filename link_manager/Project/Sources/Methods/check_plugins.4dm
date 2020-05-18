//%attributes = {"invisible":true,"preemptive":"capable"}
C_COLLECTION:C1488($1;$REQUIRED_PLUGINS)

If (This:C1470.isReady=Null:C1517)
	
	$REQUIRED_PLUGINS:=$1
	
	C_OBJECT:C1216($signal)
	
	$signal:=New signal:C1641
	
	CALL WORKER:C1389("check_plugins_c";"check_plugins_c";$signal;$REQUIRED_PLUGINS)
	
	If ($signal.wait(This:C1470.STANDARD_WAIT))
		This:C1470.isReady:=$signal.isReady
	End if 
	
End if 