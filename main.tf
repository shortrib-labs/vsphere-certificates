module "rye_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  request = file("${local.directories.secrets}/rye.${local.subdomain}.csr")
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "rye_certificate" {
  content = <<CHAIN
${module.rye_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/rye.${local.subdomain}.crt"
}

module "bourbon_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  request = file("${local.directories.secrets}/bourbon.${local.subdomain}.csr")
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "bourbon_certificate" {
  content = <<CHAIN
${module.bourbon_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/bourbon.${local.subdomain}.crt"
}

module "scotch_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  request = file("${local.directories.secrets}/scotch.${local.subdomain}.csr")
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "scotch_certificate" {
  content = <<CHAIN
${module.scotch_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/scotch.${local.subdomain}.crt"
}

module "potstill_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  request = file("${local.directories.secrets}/potstill.${local.subdomain}.csr")
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "potstill_certificate" {
  content = <<CHAIN
${module.potstill_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/potstill.${local.subdomain}.crt"
}

module "malt_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  request = file("${local.directories.secrets}/malt.${local.subdomain}.csr")
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "malt_certificate" {
  content = <<CHAIN
${module.malt_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/malt.${local.subdomain}.crt"
}

module "haproxy_certificate" {
  source = "github.com/shortrib-net/terraform-module-certificate"

  host  = "haproxy.${local.subdomain}"
  email = var.email
   
  gcp_service_account = module.dns_challenge_service_account.private_key
}

resource "local_file" "haproxy_certificate" {
  content = <<CHAIN
${module.haproxy_certificate.certificate}
CHAIN
  filename = "${local.directories.secrets}/haproxy.${local.subdomain}.crt"
}

resource "local_file" "haproxy_private_key" {
  content = <<CHAIN
${module.haproxy_certificate.private_key}
CHAIN
  filename = "${local.directories.secrets}/haproxy.${local.subdomain}.key"
}
