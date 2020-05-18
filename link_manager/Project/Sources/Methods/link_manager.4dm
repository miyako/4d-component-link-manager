//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$EXPORT)

If (Storage:C1525.EXPORT=Null:C1517)
	Use (Storage:C1525)
		$EXPORT:=New shared object:C1526
		Storage:C1525.EXPORT:=$EXPORT
	End use 
Else 
	$EXPORT:=Storage:C1525.EXPORT
End if 

$LAST_FORMULA_NAME:="scan"

If ($EXPORT[$LAST_FORMULA_NAME]=Null:C1517)
	
	Use ($EXPORT)
		
		$EXPORT.STANDARD_WAIT:=signal_default_wait
		
		$REQUIRED_PLUGINS:=New shared collection:C1527("UDP")
		
		$EXPORT.isReady:=Null:C1517
		
		Formula:C1597(check_plugins ).call($EXPORT;$REQUIRED_PLUGINS)
		
		$EXPORT.REQUIRED_PLUGINS:=$REQUIRED_PLUGINS
		
		$EXPORT.dialog:=Formula:C1597(f_dialog )
		
		$EXPORT[$LAST_FORMULA_NAME]:=Formula:C1597(f_scan )
		
	End use 
	
End if 

$0:=$EXPORT