/*resource "random_string" "random-words" {
  length = 15
  special = true
}

resource "local_file" "random_strings" {
  filename = "random_string.txt"
  content = random_string.random-words.result
}*/