//%attributes = {}
/* returns a shared singleton */
$link_manager:=link_manager 

$params:=New object:C1471("ports";New collection:C1472(19813;19814);"wait";1)

$link_manager.dialog($params)

If (False:C215)
	
	$params:=New object:C1471("port";19813;"wait";1)
	$formula:=Formula:C1597(on_after_scan )
	$ctx:=New object:C1471("window";0;"method";"")
	
/* atomic call */
	$status:=$link_manager.scan()
	
/* async call */
	$status:=$link_manager.scan($params;$formula;$ctx)
	
End if 