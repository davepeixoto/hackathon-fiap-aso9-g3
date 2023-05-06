variable "project_name" {
  description = "GCP Project name"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-west1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-west1-b"
}

variable "db_instance" {
  description = "Google Db Instance"
  type        = string
  default     = "db_instance"
}

variable "db_username" {
  description = "Google Cloud Db Instance User Name"
  type        = string
  default     = "db_username"
}