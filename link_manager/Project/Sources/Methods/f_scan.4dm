//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$params;$2;$formula;$3;$ctx)
C_OBJECT:C1216($0;$status)

$status:=o_status 

If (This:C1470.isReady)
	
	$argc:=Count parameters:C259
	
	If (True:C214)
		
		If ($argc#0)
			$params:=$1
		End if 
		
		If ($argc>1)
			$formula:=$2
		End if 
		
		If ($argc>1)
			$ctx:=$3
		End if 
		
	End if 
	
	C_TEXT:C284($workerName)
	$workerName:=New collection:C1472(Current method name:C684;"@";Generate UUID:C1066).join("";ck ignore null or empty:K85:5)
	
	$signal:=New signal:C1641
	
	CALL WORKER:C1389($workerName;"f_scan_p";$signal;$params;$formula;$ctx)
	
	$useFormula:=False:C215
	
	If ($formula#Null:C1517)
		If (JSON Stringify:C1217($formula)="\"[object Formula]\"")
			$useFormula:=True:C214
		End if 
	End if 
	
	If ($useFormula)
		$status.success:=True:C214
	Else 
		
		If ($signal.wait(This:C1470.STANDARD_WAIT))
			
			$status.success:=$signal.success
			$status.servers:=JSON Parse:C1218($signal.servers;Is collection:K8:32)
			
		Else 
			$status.error:=e_signal_timeout (This:C1470.STANDARD_WAIT)
		End if 
		
	End if 
	
End if 

$0:=$status