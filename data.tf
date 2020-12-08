data "external" "ssm_parameters" {
  program = ["sh", "./ssm_parameters.sh", var.ssm_path]
  working_dir = "${path.module}/scripts"
}
