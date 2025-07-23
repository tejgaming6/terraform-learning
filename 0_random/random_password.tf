/* resource "random_password" "app1_password" {
    length = 15
    special = true
}

resource "local_file" "app1" {
  filename = "passwordkeeper.txt"
  content = random_password.app1_password.result
} */