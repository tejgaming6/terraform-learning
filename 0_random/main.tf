resource "random_pet" "my_new_petname" {
  for_each = var.prefix
  prefix = each.key
}

resource "local_file" "pet" {
  filename = "${each.key}boolpetname.txt"
  for_each = var.prefix
  content = random_pet.my_new_petname[each.key].id
}

