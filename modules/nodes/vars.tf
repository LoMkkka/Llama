# Значение SSH-ключа для доступа к облачному серверу!!! указать путь
variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/ksUHmYkdzRAM4DHuyXAmRrzCluYs34QQc6IsEKwe/Jl6t0+ggvFl0I5XZUXCZAxcaS6Tiyq0zWfFQm4oupz2rqVFUjg8Fo3Cwb5mJsqhn9e33d3Gj2mDvhe5o/QvpCTUoFJcXICR56q2eFgkpVkD+1DTgI3g5Zs7T3uqbD5ehT8h7f/0C0lL5eXa9mGouCGABWSqHcpBzo52jCuw5im3VVSY2Xd4AOFxMFU1y2hMXM9ig/eyc9W2U+0j7+S3PbFGTaFUgBa51ws7WCqcMgf//8wXszO5MVAocUJh3nFYtSjQ2nlZz3ewhjnBNQ/FiAVQaiFdHZBRaMIYNStEfAkx9qwCaHr8MuQX+vbxsquPCTbcPbjUg+eYYnMV4G7VHHvhhbLx3SAYpJ52S4FUZzUlszE3SyV+ZyDtm6aR2pz3IbUpahL9l/g63tqksLpwXg9JOx+rAjd3qhlSyNKJOUo6ZTauVxveHkdOB5dw0Ns6G8gTX+CgS6gsW+gf8ChCfAE= golovitskii.d@golovitskii-d"
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

variable "int_count" {
  type    = number
  default = 3
}

# #указать пусть
variable "pvt_key" {
  default   = "/root/.ssh/id_rsa"
}
