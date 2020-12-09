# terraform-aws-psenv

> Terraform module to use Parameter Store with task definitions.

## Why?

[Terraform Provider for AWS](https://github.com/hashicorp/terraform-provider-aws) does not offers a data source to get values from Parameter Store by path (using [*GetParametersByPath API*](https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_GetParametersByPath.html)) and we need to get those values to configure our task definitions.

*See this Pull Request: [terraform-provider-aws#9615)](https://github.com/hashicorp/terraform-provider-aws/pull/9615).*

## Usage

Replace the version on `?ref=v0.0.0` with a valid release value ([list](/releases)).

```hcl
module "aws_psenv" {
  source = "git@github.com:grupomytec/terraform-aws-psenv?ref=v0.0.0"
  ssm_path = "/api/production/"
}

output "environment_variables" {
  value = module.aws_psenv.environment_variables
}
```

Output (just a example):

```
environment_variables = [{"name":"FOO","valueFrom":"arn:aws:ssm:us-east-1:999999999999:parameter/api/production/FOO"},{"name":"BAR","valueFrom":"arn:aws:ssm:us-east-1:999999999999:parameter/api/production/BAR"}]
```

## Requirements

- [aws-cli](https://aws.amazon.com/pt/cli/)
- [sh](https://pt.wikipedia.org/wiki/Shell_script)

## Inputs

|Name|Description|Type|Default|
|:---:|:---|:---:|:---:|
|`ssm_path`|The hierarchy for the parameter.|`string`|`/`|
|`value_from`|Use valueFrom syntax (with the parameter ARN).|`bool`|`true`|

## TODO

- [ ] Use `curl` instead of `aws-cli`

## Maintainers

- Matheus Alves ([@theuves](https://github.com/theuves))

## License

Licensed under MIT license.

Copyright &copy; 2020 by Grupo Mytec.
