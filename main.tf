/* resource "local_file" "content" {
filename = "test001.txt"
content = var.content
}

resource "local_file" "number" {
 filename = "test999.txt"
 content = var.content
} 

provider "null" {}

resource "null_resource" "create_dirs_and_files" {
  provisioner "local-exec" {
    command = <<TEJ
      mkdir -p "${var.dir[0]}" "${var.dir[1]}"
      touch "${var.file[0]}"
      touch "${var.file[1]}"
    TEJ
  }
}

*/