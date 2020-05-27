//%attributes = {"invisible":true,"preemptive":"incapable"}
If (This:C1470#Null:C1517)
	
	TRACE:C157
	
	C_OBJECT:C1216($file)
	$file:=File:C1566("/RESOURCES/link.4dtag")
	
	If ($file.exists)
		
		C_TEXT:C284($template;$database_shortcut)
		$template:=$file.getText("utf-8";Document unchanged:K24:18)
		PROCESS 4D TAGS:C816($template;$database_shortcut;This:C1470)
		
		C_OBJECT:C1216($folder)
		$folder:=Folder:C1567(Temporary folder:C486+Generate UUID:C1066;fk platform path:K87:2)
		$folder.create()
		
		$file:=$folder.file(This:C1470.name+".4dlink")
		$file.setText($database_shortcut;"utf-8";Document unchanged:K24:18)
		
		OPEN DATABASE:C1321($file.platformPath)
		
	End if 
	
End if 