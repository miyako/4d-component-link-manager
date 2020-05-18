$event:=FORM Event:C1606

Case of 
	: ($event.code=On Clicked:K2:4)
		
		OBJECT SET ENABLED:C1123(*;OBJECT Get name:C1087(Object current:K67:2);False:C215)
		
		CALL WORKER:C1389(Form:C1466.worker.name;Form:C1466.worker.delegate;Form:C1466.ctx;Form:C1466.params)
		
End case 