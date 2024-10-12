terraform {
  cloud {

    organization = "test-project-org"

    workspaces {
      name = "test-project"
    }
  }
}

resource "null_resource" "test-project" {
  provisioner "local-exec" {
    command = "echo 'TEST PROJECT HCP TERRAFORM' "
  }
}