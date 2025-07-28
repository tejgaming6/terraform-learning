/* resource "random_password" "app1_password" {
    length = 15
    special = true
}

resource "local_file" "app1" {
  filename = "passwordkeeper.txt"
  content = random_password.app1_password.result
} */

/*resource "random_password" "test1" {
  length = var.value
}

resource "local_file" "password1" {
  filename = "new_auto_password.txt"
  content = random_password.test1.result
}

resource "local_file" "password2" {
  filename = "new_auto_password1.txt"
  content = "1${random_password.test1.result}"
}*/