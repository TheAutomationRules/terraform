locals {

  workspace = {
    default = {
      data = "workspace_default_data"
    }
    dev = {
      data = "workspace_dev_data"
    }
  }

  data = lookup(local.workspace[terraform.workspace], "data")

}

output "example_data" {
  value = local.data
}