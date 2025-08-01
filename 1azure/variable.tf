# fixed should be same 
variable "subscription_id" {
  type = string
}

variable "rgname" {
  type = list(string)
}

variable "rglocation" {
  type = list(string)
}

variable "vmname" {
  type = string
}

variable "count_all" {
  type = number
}

variable "address_space" {
  type = string
}

variable "subnet" {
  type = string
}

variable "network_interface" {
  type = string
}

variable "ipname" {
  type = string
}

variable "linuxname" {
  type = string
}

variable "size" {
  type = string
}

variable "username" {
  type = string
}

variable "publc_ip_name" {
  type = string
}