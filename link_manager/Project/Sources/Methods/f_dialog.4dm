//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$params)
C_OBJECT:C1216($signal)

$argc:=Count parameters:C259

If ($argc>0)
	$params:=$1
End if 

$signal:=New signal:C1641

CALL WORKER:C1389(1;"f_dialog_c";$signal;$params)

$signal.wait()