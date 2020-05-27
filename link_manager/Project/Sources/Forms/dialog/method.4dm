$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		If (Not:C34(Is compiled mode:C492))
			OBJECT SET VISIBLE:C603(*;"debug.@";True:C214)
		End if 
		
		C_COLLECTION:C1488($ports)
		$ports:=Form:C1466.ports
		
		If ($ports=Null:C1517)
			$ports:=New collection:C1472
		End if 
		
		If ($ports.length=0)
			$ports.push(Get database parameter:C643(Client Server port ID:K37:35))
		End if 
		
		If (Value type:C1509(Form:C1466.port)=Is real:K8:4)
			$ports.push(Form:C1466.port)
		End if 
		
		C_LONGINT:C283($wait)
		If (Value type:C1509(Form:C1466.wait)=Is real:K8:4)
			$wait:=Form:C1466.wait
		Else 
			$wait:=1
		End if 
		
		C_OBJECT:C1216($ctx)
		$ctx:=New object:C1471
		$ctx.window:=Current form window:C827
		$ctx.method:="on_after_scan_ui"
		$ctx.formula:=Formula:C1597(on_after_scan )
		$ctx.start:=Milliseconds:C459
		$ctx.delay:=form_timer_default_delay  //ticks
		$ctx.tag:="origin"  //tell caller that this ctx is the start object
		$ctx.updateNow:=True:C214
		$ctx.interval:=form_timer_default_interval
		
		  //listbox data source
		Form:C1466.servers:=New object:C1471("col";New collection:C1472;"sel";New collection:C1472;"item";Null:C1517;"pos";Null:C1517)
		
		C_OBJECT:C1216($worker)
		$worker:=New object:C1471
		$worker.name:=Current form name:C1298+"@"+String:C10(Current form window:C827)
		$worker.delegate:="dialog_p"
		
		Form:C1466.ctx:=$ctx
		Form:C1466.worker:=$worker
		
		$params:=New collection:C1472
		C_LONGINT:C283($port)
		For each ($port;$ports)
			$param:=New object:C1471("port";$port;"wait";$wait)
			$params.push($param)
		End for each 
		
		Form:C1466.params:=$params
		
		CALL WORKER:C1389($worker.name;$worker.delegate;$ctx;$params)
		
/*
mutate $ctx for one-shot call worker injection
now we can CALL WORKER(Form.worker.name;Form.worker.delegate;Form.ctx;Form.params)
without starting a new shadow runloop
*/
		
		$ctx.tag:="oneshot"
		$ctx.updateNow:=True:C214
		
		Form:C1466.servers.metas:=New collection:C1472(New object:C1471;New object:C1471)
		Form:C1466.servers.metas[0].stroke:="#F5EEF8"
		Form:C1466.servers.metas[0].fill:="#633974"
		Form:C1466.servers.metas[1].stroke:="#633974"
		Form:C1466.servers.metas[1].fill:="#F5EEF8"
		
		Form:C1466.connect:=Formula:C1597(connect_to_server )
		
	: ($event.code=On Unload:K2:2)
		
		KILL WORKER:C1390(Form:C1466.worker.name)
		
	: ($event.code=On Activate:K2:9)
		
		CALL WORKER:C1389(Form:C1466.worker.name;Form:C1466.worker.delegate;Form:C1466.ctx;Form:C1466.params)
		
End case 