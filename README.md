## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.1.2 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 2.22.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.1.2 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.velero](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.velero](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.velero_s3_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_velero"></a> [velero](#input\_velero) | n/a | <pre>object({<br>    repository = string<br>    chart = string<br>    chart_version = string<br>    name = string<br>    helm_release_params = map(object({<br>      type = string<br>      value = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_velero_s3_credentials"></a> [velero\_s3\_credentials](#input\_velero\_s3\_credentials) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_velero_helm_chart"></a> [velero\_helm\_chart](#output\_velero\_helm\_chart) | n/a |
