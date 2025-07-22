resource "local_file" "contet-insert" {
  filename = "content_insert.txt"
  content = "I'm passing this info into the file content_insert as soon it's made" 
}
resource "local_file" "filecreation11" {
  filename = "file11.txt"
  content_base64 = "xyzabc" 
}
resource "local_file" "filecreation12" {
  filename = "file12.txt"
  content_base64 = "xyzabcefghi" 
}
resource "local_file" "source_file_copy11" {
  filename = "copy11.txt"
  source = "/workspaces/terraform-learning/learning/local.txt"
}