# Значение SSH-ключа для доступа к облачному серверу (вставить свой)
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM/FSIiFZDseCTwuNyGLQrvlWAx1IE6O2udi01SNmXlvlqYlwt0iRZ8HcH4X2iF4qTNDDNwBGhXePfAfrS8/iXL/sEC159K4XsuLHsV1kyIySnri2mlM0pW15Pm4pi27KKGDbEy70z7gJb5NOpQ7BvluEka7XB/ZVDtShxvhy/o7ehsNydZMvoy9MXkAtYU35x8TVCQUfZAP153MSEIWywfe9ha0Dpog/Ed2eY66rE2EIGZVJTf9sPKyCq6yA4uLEYbxO9UgV9456D6ZVwScEcZydDBXrOUE98BCr8smxpLkvtSAz9SPGl8H8Miqc101l8Emh9HWe2k+lTXJA2lSsw51VsDFqkDlRFyVoXzJHb1eXJwPY4C1hTYsCqyrtAmnBt7KgrPOBBDdLnjh1TiPYAV2xUMXmxTYo+dJhfLLDUxNfcUc7Kx4QyX1Wdd6YO/0tTHKQ23ZiTpTuWeDpH/DKd+gyaTrZYEGGMw2j3WL6E/WEhyYGYAHSLkEmQwO22tZc= root@master"
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
