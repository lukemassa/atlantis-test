# Some more tf again

resource "terraform_data" "my-resource" {
  input = "23"
}

data "external" "delay" {
  program = ["bash", "-c", "sleep 60 && echo '{\"result\":\"ok\"}'"]
}
