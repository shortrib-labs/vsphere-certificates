module "dns_challenge_service_account" {
    source = "github.com/shortrib-net/terraform-module-gcp-service-account"

    gcp_project = var.gcp_project
    
    account_id = "${local.dashed_environment}-dns-challenge"    
    display_name = "DNS Challenge"
    description  = "Access to DNS to create certificates for services in ${local.environment}"
    roles = [ "roles/dns.admin" ]
}

