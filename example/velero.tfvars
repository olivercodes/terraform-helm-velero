velero = {
  repository = "https://vmware-tanzu.github.io/helm-charts"
  name = "velero"
  chart = "velero"
  chart_version = "2.23.3"

  helm_release_params = {
    "snapshotsEnabled" = {
      type = "auto"
      value = false
    }
    "credentials.useSecret" = {
      type = "auto"
      value = true
    }
    "credentials.existingSecret" = {
      type = "auto"
      value = "velero-s3-credentials"
    }
    "configuration.provider" = {
      type = "string"
      value = "aws"
    }
    "configuration.backupStorageLocation.bucket" = {
      type = "string"
      value = "velero"
    }
    "configuration.backupStorageLocation.config.region" = {
      type = "string"
      value = "us-east-1"
    }
    "configuration.backupStorageLocation.config.s3ForcePathStyle" = {
      type = "string"
      value = "true"
    }
    "configuration.backupStorageLocation.config.s3Url" = {
      type = "string"
      value = "http://url"
    }
    "initContainers[0].name" = {
      type = "string"
      value = "velero-plugin-for-aws"
    }
    "initContainers[0].image" = {
      type = "string"
      value = "velero/velero-plugin-for-aws:v1.2.0"
    }
    "initContainers[0].volumeMounts[0].mountPath" = {
      type = "string"
      value = "/target"
    }
    "initContainers[0].volumeMounts[0].name" = {
      type = "string"
      value = "plugins"
    }
  }
}
