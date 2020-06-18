# 4d-component-link-manager
UDP scan for 4D Server II payload and display in listbox (v18)

### Usage (UI)

```4d
/* returns a shared singleton */
$link_manager:=link_manager 

$params:=New object("ports";New collection(19813;19814);"wait";1)
$link_manager.dialog($params)
```

#### Remarks

When running from the main process (``On Startup``, ``SET ABOUT``...) make sure to start a new process.

<img width="767" alt="" src="https://user-images.githubusercontent.com/1725068/82210630-620efb00-994a-11ea-9706-2413cca826a2.png">

* For best performance, run in compiled mode!

* The plugin call to UDP scan will each run in a dedicated premptive thread in compiled mode.

* The dialog will run in the main process (``1``). Multiple instances are supported (``DIALOG(*)``.

* Unlike the default "connect to server" dialog, supports multiple port numbers.

* By default, the list is updated every ``10`` seconds. See [constants.xlf](https://github.com/miyako/4d-component-link-manager/blob/master/link_manager/Resources/constants.xlf).

* Also, it is updated with each ``On Activate`` form event.

### Usage (API)

```4d
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
