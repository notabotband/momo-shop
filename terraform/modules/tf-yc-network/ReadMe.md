#Модуль для сети tf-yc-network
Child модуль корневого модуля

###Provider
Используется provider - "yandex-cloud/yandex"
версии ">= 0.13"


###Параметры которые можно задать:
zones - set(string) default = [
"ru-central1-c",
"ru-central1-b",
"ru-central1-a",
]

###Variable
```
variable "zones" {
description = "Zones"
type = set(string)
default = [
"ru-central1-c",
"ru-central1-b",
"ru-central1-a",
]
}
```

###Outputs: net & subnet