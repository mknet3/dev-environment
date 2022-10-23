resource "helm_release" "prometheus" {
  name       = "prometheus-community"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "41.5.1"

  namespace  = "monitoring"

  values = [
    "${file("k8s/prometheus-values.yaml")}"
  ]

  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
}