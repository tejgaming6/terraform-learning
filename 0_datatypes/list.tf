variable "name_list" {
  type = string
  default = "test.txt"
  }

resource "local_file" "ec2names" {
  filename = var.name_list
  content = "making 3 files with the help of list"
}