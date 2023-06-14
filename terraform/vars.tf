variable "location" {
  type = string
  description = "Region de Azure"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la VM"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU
}
