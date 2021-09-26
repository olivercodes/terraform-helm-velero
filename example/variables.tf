variable "velero" {
  type = object({
    repository = string
    chart = string
    chart_version = string
    name = string
    helm_release_params = map(object({
      type = string
      value = string
    }))
  })
}

variable "velero_s3_credentials" {
  sensitive = true
  type = string
}


