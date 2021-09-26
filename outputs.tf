output "velero_helm_chart" {
  value = {
    "name"          = helm_release.velero.name
    "namespace"     = helm_release.velero.namespace
    "chart_version" = helm_release.velero.version
    "status"        = helm_release.velero.status
  }
}
