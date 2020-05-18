$event:=FORM Event:C1606

$collection:="servers"

Case of 
	: ($event.code=On Begin Drag Over:K2:44)
		
/*
		
bug in v18.1.250926
in project mode, drag=none triggers an automatic effect on ui
		
*/
		
		$0:=-1
		
	: ($event.code=On Selection Change:K2:29)
		
		  //opt out automatic management
		
		C_LONGINT:C283($r;$c)
		LISTBOX GET CELL POSITION:C971(*;$collection;$c;$r)
		
		If ($r#0)
			Form:C1466[$collection].item:=Form:C1466[$collection].col[$r-1]
		Else 
			Form:C1466[$collection].item:=Null:C1517
		End if 
		
		If (Form:C1466[$collection].item#Null:C1517)
			Form:C1466[$collection].sel:=New collection:C1472(Form:C1466[$collection].item)
		Else 
			Form:C1466[$collection].sel:=New collection:C1472
		End if 
		
	: ($event.code=On Double Clicked:K2:5)
		
		If (Form:C1466[$collection].item#Null:C1517)
			
		End if 
		
End case 