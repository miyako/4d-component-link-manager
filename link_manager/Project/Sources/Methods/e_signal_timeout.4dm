//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$timeout)
C_OBJECT:C1216($0;$error)

$timeout:=$1

$error:=New object:C1471("code";signal_timeout_error;"description";Get localized string:C991("signal_timeout_error"))

$0:=$error