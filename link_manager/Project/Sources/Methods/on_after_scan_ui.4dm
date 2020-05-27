//%attributes = {"invisible":true,"preemptive":"incapable"}
C_LONGINT:C283($1;$port)
C_COLLECTION:C1488($2;$servers)

$port:=$1
$servers:=$2

C_OBJECT:C1216($server)

Form:C1466.timestamp:=Timestamp:C1445

C_COLLECTION:C1488($subset)
$subset:=Form:C1466.servers.col.query("port == :1";$port)

For ($i;0;$subset.length-1)
	$server:=$subset[$i]
	If ($servers.query("name == :1 and addr == :2";\
		$server.name;$server.addr).length=0)
		
		If (Form:C1466.servers.sel.indexOf(Form:C1466.servers.item)#-1)
			Form:C1466.servers.item:=Null:C1517
		End if 
		
		Form:C1466.servers.col.remove(Form:C1466.servers.col.indexOf($server))
		Form:C1466.servers.sel.remove(Form:C1466.servers.sel.indexOf($server))
	End if 
	
End for 

For each ($server;$servers)
	$server.port:=$port
	If (Form:C1466.servers.col.query("name == :1 and addr == :2 and port == :3";\
		$server.name;$server.addr;$port).length=0)
		Form:C1466.servers.col.push($server)
	End if 
	
End for each 

Form:C1466.servers.col:=Form:C1466.servers.col.orderBy("name asc")