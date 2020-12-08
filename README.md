# terraform-aws-psenv

> Módulo do Terraform para extrair dados do Parameter Store na sintaxe JSON de variáveis de ambientes para task definitions.

## Uso

```hcl
module "aws_psenv" {
  source = "git@github.com:grupomytec/terraform-aws-psenv?ref=v0.0.0"
  ssm_path = "/api/production/"
}

output "environment_variables" {
  value = module.aws_psenv.environment_variables
}
```

Output (example):

```
environment_variables = [{"name":"FOO","valueFrom":"arn:aws:ssm:us-east-1:999999999999:parameter/api/production/FOO"},{"name":"BAR","valueFrom":"arn:aws:ssm:us-east-1:999999999999:parameter/api/production/BAR"}]
```

## Parâmetros

- `ssm_path`
  - **Tipo:** `string`
  - **Padrão** `/`
  - **Descrição:** Path dos parâmetros que serão usados na task definition.
- `value_from`
  - **Tipo:** `bool`
  - **Padrão:** `true`
  - **Descrição:** Informa se deve usar `valueFrom` (com o ARN), caso contrário retorna diretamente o valor.

## Requisitos

- Linux (não funciona com Windows)
- AWS CLI

## TODO

- [ ] Traduzir documentação para inglês
- [ ] Versão para Windows
