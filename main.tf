locals {
  parameters = jsondecode(data.external.ssm_parameters.result.json).Parameters

  # Environment variables with 'value' and 'valueFrom'
  environment_variables = jsonencode([
    for parameter in local.parameters : merge({
      name = reverse(split("/", parameter.Name))[0]
    }, (
      var.value_from
        ? { valueFrom = parameter.ARN }
        : { value = parameter.Value }
    ))
  ])
}
