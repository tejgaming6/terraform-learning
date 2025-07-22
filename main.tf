resource "local_file" "content" {
filename = "test001.txt"
content = var.content
}

resource "local_file" "number" {
 filename = "test999.txt"
 content = var.content
}
