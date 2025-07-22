resource "local_file" "copy" {
  filename = "ra.txt"
  content = ""
  source = "workspaces/terraform-learning/learning/provider.tf"
}