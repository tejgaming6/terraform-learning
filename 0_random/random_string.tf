resource "random_string" "random-words" {
  length = var.string_length
  special = true
}

resource "local_file" "random_strings" {
  filename = "random_string.txt"
  content = random_string.random-words.result
}

resource "local_file" "result_content" {
  filename = "random_string1.txt"
  content = " xyz: ${random_string.random-words.result}"

}