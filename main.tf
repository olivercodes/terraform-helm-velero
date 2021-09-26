resource "kubernetes_namespace" "velero" {
  metadata {
    name = "velero"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels
    ]
  }
}


resource "kubernetes_secret" "velero_s3_credentials" {
  metadata {
    name = "velero-s3-credentials"
    namespace = kubernetes_namespace.velero.metadata.0.name
  }

  data = {
    cloud = var.velero_s3_credentials
  }
}

resource "helm_release" "velero" {
  depends_on = [kubernetes_secret.velero.minio]
  repository = var.velero.repository
  name = var.velero.name
  chart = var.velero.chart
  version = var.velero.chart_version
  namespace = kubernetes_namespace.velero.metadata.0.name

  dynamic "set" {
    for_each = var.velero.helm_release_params
    content {
      name = set.key
      type = set.value["type"]
      value = set.value["value"]
    }
  }
}
