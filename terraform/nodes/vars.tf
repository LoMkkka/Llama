# Сегмент пула
variable "az_zone" {
  default = "ru-3b"
}

# Тип сетевого диска, из которого создается сервер
variable "volume_type" {
  default = "fast.ru-3b"
}

#CPU
variable "vCPU" {
  default = 2
}

#RAM
variable "rams" {
  default = 4096
}
# CIDR подсети
variable "subnet_cidr" {
  default = "10.10.1.0/24"
}

variable "int_count" {
  type    = number
  default = 3
}
