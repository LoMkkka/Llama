# Значение SSH-ключа для доступа к облачному серверу
variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWjPmr+OGpRitW1ybZXl34cKR46Hoiku8FS2w8Ng0BS6WVHS1G7ylxQ6tyJsejI8LLw1mGscjlp3jNf4sIXp8OiH73xrf5N10JgF1aBs0MQQD7sQvwaf9OxH2Q5YTcgmDFZ/hkDcRFvgsgIqDXNyHNf+47IqOJbPqU4td0xwnAwYOr4Q0Itn6K1nH4nko0nhxm7HqoLGgNeZzcmjB0EmsDTfovbtjNHf+/SG/tDV5vQg80SLEcQzRR/jt52LU/t/jev+NaHd3MQRVrD5665UVMj8JAa73TVKmswHda0QDrJXX35i6Aipb4i4Q4bhJgZWSAxnDm3ble6W4WqEHg1Jix5LAup9LjhaaM/Wnsj/JUijlr+NHX4uD7RlXRWXFU9HmSMp31jwAx2wVHpWeVAL/3U3HuEM4WZX5HpGA+7apZ5k4wdCdodg+Hi0+aIF31AbQDOW79m3vu1vTY0uaPm6qCi0Fkd+09MOtE2kDPBGyKZPkzt/lUt01XMShotc9BQes= root@node2"
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


# # #указать пусть

