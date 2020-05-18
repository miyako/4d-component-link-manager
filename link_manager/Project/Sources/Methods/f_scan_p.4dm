//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$signal;$2;$params;$3;$formula;$4;$ctx)

$signal:=$1
$params:=$2
$formula:=$3
$ctx:=$4

/* 
the charset used to decode depends on Get database localization, 
which may take lproj into account 
*/

$servers:=UDP Get server list ($params)

If (Not:C34(Process aborted:C672))
	
	$useFormula:=False:C215
	
	If ($formula#Null:C1517)
		If (JSON Stringify:C1217($formula)="\"[object Formula]\"")
			$useFormula:=True:C214
		End if 
	End if 
	
	If ($useFormula)
		$formula.call($ctx;$servers)
	Else 
		Use ($signal)
			$signal.success:=True:C214
			$signal.servers:=JSON Stringify:C1217($servers)
		End use 
	End if 
	
	$signal.trigger()
	
End if 

KILL WORKER:C1390