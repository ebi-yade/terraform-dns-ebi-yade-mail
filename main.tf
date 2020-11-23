#####################################
# Provider Settings
#####################################
provider "aws" {
  version = "~> 3.7.0"
  region  = "us-east-1" # North Virginia Region
  profile = var.profile
  #alias = "use1"
}


#####################################
# Modules
#####################################

module "domains" {
  source = "./modules/domains"

  domain_name = local.domain_name

  public_records = local.public_records

  suffix       = local.suffix
  suffix_kebab = local.suffix_kebab
  tags = {
    Terraform = "true"
    Name      = local.suffix
  }
}
