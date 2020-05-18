//%attributes = {"invisible":true,"preemptive":"capable"}
C_COLLECTION:C1488($1;$servers)

$servers:=$1

C_LONGINT:C283($window)
$window:=This:C1470.window

C_LONGINT:C283($port)
$port:=This:C1470.port

C_TEXT:C284($method)
$method:=This:C1470.method

CALL FORM:C1391($window;$method;$port;$servers)