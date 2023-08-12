#Модуль для виртуальной машины tf-yc-instance
Child модуль корневого модуля

###Provider
Используется provider - "yandex-cloud/yandex"
версии ">= 0.13"

###Параметры которые можно задать:

name - ```string```
default = "chapter5-task2-std-013-59"

image_id - ```string```
default = "fd8cqj9qiedndmmi3vq6"

subnet_id - ```string```
(Подсказка: подсмотреть, как выглядит имя подсети, можно так: yc vpc subnets list)

platform_id - ```string```
default = "standard-v1"

zone - ```string```
default = "ru-central1-a"

cores - ```number```
default = 2

memory - ```number```
default = 2

###Variable
```
variable "name" {
  description = "Name"
  type = string
  default = "chapter5-task2-std-013-59"
}

variable "image_id" {
  description = "Image id"
  type = string
  default = "fd8cqj9qiedndmmi3vq6"
}

variable "subnet_id" {
  description = "CIDR block for the subnet"
  type = string
  default = "e9bi95vd74f8lp1mgdvm"
}

variable "platform_id" {
  description = "Platform id"
  type = string
  default = "standard-v1"
}

variable "zone" {
  description = "Zone"
  type = string
  default = "ru-central1-a"
}

variable "cores" {
  description = "Cores"
  type = number
  default = 2
}

variable "memory" {
  description = "Memory"
  type = number
  default = 2
}
```

###Output: "ip_address"
