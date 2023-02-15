variable "project_id" {
  description = "GCP project ID in which the auto-scaler group is created in. e.g.: test-367504"
  type        = string
}

variable "region" {
  description = "The region chosen to be used by the instance-group. e.g.: us-west1"
  type        = string
}

variable "xwiki_mig" {
  description = "Xwiki managed instance group"
  type        = any
}

variable "lb_ip" {
  description = "The global_addresses ip for load-balancer."
  type        = string
}