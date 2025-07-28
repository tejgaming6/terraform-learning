/*variable "any_string" {
  type = any
  default = "string_t2micro"
}

resource "local_file" "anystring" {
  filename = "any.string.txt"
  content = var.any_string
}

variable "any_number" {
 type = any
 default = 123
}

resource "local_file" "anynumber" {
  filename = "any.number.txt"
  content = var.any_number
}

variable "any_bool" {
    type = any
    default = true
}

resource "local_file" "anybool" {
  filename = "any.bool.txt"
  content = var.any_bool
}

variable "any_any" {
  type = any
    default = "string123"
}

resource "local_file" "anyany" {
  filename = "any.any.txt"
  content = var.any_any
}*/