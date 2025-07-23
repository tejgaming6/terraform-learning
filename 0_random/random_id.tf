/*resource "random_id" "azureserver" {
  byte_length = 8
}

resource "local_file" "Azurefiles" {
  filename = "random_id.txt"
  content = azurefilerandom_id.azureserver.hex
}*/

resource "random_id" "ids" {
  byte_length = var.multiple_id
}

resource "local_file" "adding_ids" {
  filename = "id1.txt"
  content = "${random_id.ids.hex}"
}
resource "local_file" "adding_id2" {
  filename = "id2.txt"
  content = "$1${random_id.ids.hex}"
}
resource "local_file" "adding_ids3" {
  filename = "id3.txt"
  content = "2${random_id.ids.hex}"
}
resource "local_file" "adding_ids4" {
  filename = "id4.txt"
  content = "3${random_id.ids.hex}"
}
resource "local_file" "adding_ids5" {
  filename = "id5.txt"
  content = "4${random_id.ids.hex}"
}