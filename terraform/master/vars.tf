# Значение SSH-ключа для доступа к облачному серверу (вставить свой)
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4rtoQpEFEXJ4/2dE2lgCraRy/422xjl+q9Ea7esk7yIzNO9UctovnSF8TlfN/XKKOG9roR093D1Bpo18ptz5b3nIHPMwJRDviZ7HVb/f+KuaCDdNEGRIbayqVY7nohQ/B9X6y2QAqSbzlcXOSuxX+Ea70P+eY6n0qpBwwRl+g/kMmru5yqOxu5KsybpH47pNs4qbVY6Fe5KEoTb+RF+ovGmXUTlIrr9a88QO1MYFnAA58Zc7ywzMxP6ToVhd2QNZ75qvwqWvH89uhxPbmArLgKzS3DHQ59pchtfmmh/Dk6KsZrfqAl1tlYMgdSKK7DHQ8vPwF4tiMhEI5aj7OOvOmLEgkUde+J0HrBi93KOCYGNRkcAX/uWQRYamVKFJNkQYiUj5HCEHAnLZftzlSgNbBHwzMPBE7U2w9o6PlNIwWg50PYAtODlF0nnYrbRUkcgsyRWOZGhAd0/YLIEY0+mgcUGcz9GbApNKR+kgAeh2aA2S8TDRMn1JdU+oau8Yn3ps= root@master"
}

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
