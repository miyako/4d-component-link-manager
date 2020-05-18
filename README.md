# 4d-component-link-manager
UDP scan for 4D Server II payload and display in listbox (v18)

### Usage (UI)

```
/* returns a shared singleton */
$link_manager:=link_manager 

$params:=New object("ports";New collection(19813;19814);"wait";1)
$link_manager.dialog($params)
```

<img width="767" alt="" src="https://user-images.githubusercontent.com/1725068/82210630-620efb00-994a-11ea-9706-2413cca826a2.png">

For best performance, run in compiled mode!

The plugin call to UDP scan will each run in a premptive thread.

Unlike the default "connect to server" dialog, supports multiple port numbers.

By default, the list is updated every ``10`` seconds.

See [constants.xlf](https://github.com/miyako/4d-component-link-manager/blob/master/link_manager/Resources/constants.xlf).

Also, it is updated with each ``On Activate`` form event.

### Usage (API)

```
/* returns a shared singleton */
$link_manager:=link_manager 

$params:=New object("port";19813;"wait";1)
$formula:=Formula(on_after_scan )
$ctx:=New object("window";0;"method";"")

/* atomic call */
$status:=$link_manager.scan()

/* async call */
$status:=$link_manager.scan($params;$formula;$ctx)
```
