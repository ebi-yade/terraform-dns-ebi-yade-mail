#####################################
# General
#####################################
variable tags { type = map }

variable suffix {
  type        = string
  description = "suffix in camel case"
}
variable suffix_kebab {
  type        = string
  description = "suffix in kebab case"
}

#####################################
# Peculiar To This Repo
#####################################

# Route53 Config
variable domain_name {}
variable public_records {}
