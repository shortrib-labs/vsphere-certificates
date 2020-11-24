variable "environment" {
    type = string
    default = ""
}

variable "domain" {
    type = string
    default = ""
}

variable "email" {
    type = string
}

variable "project_root" {
    type = string
}

variable "gcp_project" {
    type = string
}

locals {
    environment = var.environment 
    dashed_environment = replace(local.environment, ".", "-")

    subdomain = "${local.environment}.${var.domain}"
    dashed_subdomain = replace(local.subdomain, ".", "-")

    directories = {
        secrets = "${var.project_root}/secrets"
    }

}
