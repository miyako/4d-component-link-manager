# 4d-component-link-manager
UDP scan for 4D Server II payload and display in listbox (v18)

#### Usage

```4d
/* returns a shared singleton */
$link_manager:=link_manager 

$params:=New object("ports";New collection(19813;19814);"wait";1)
$link_manager.dialog($params)
```

<img width="767" alt="" src="https://user-images.githubusercontent.com/1725068/82210630-620efb00-994a-11ea-9706-2413cca826a2.png">
