/*resource "random_id" "azureserver" {
  byte_length = 8
}

resource "local_file" "Azurefiles" {
  filename = "random_id.txt"
  content = azurefilerandom_id.azureserver.hex
}*/