//%attributes = {"invisible":true,"preemptive":"incapable"}
C_OBJECT:C1216($1;$signal;$2;$params)

$signal:=$1
$params:=$2

$window:=Open form window:C675("dialog")
DIALOG:C40("dialog";$params;*)

$signal.trigger()