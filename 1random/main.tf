resource "random_bytes" "bytes_object" {
length = var.legnth_types["short"] 
}

resource "local_file" "inputfrombytes" {
  filename = "random.txt"
  file_permission = "600"
  content = random_bytes.bytes_object.base64
} 

