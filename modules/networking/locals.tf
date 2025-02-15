locals {
  cidr_whitelist = concat(var.private_subnets_cidrs, var.cidr_whitelist)

  enviroment = lookup({ prd = "prd", stg = "stg" }, var.env_name, "dev")
  is_prd = local.enviroment == "prd" ? true : false
  is_stg = local.enviroment == "stg" ? true : false
  is_dev = local.enviroment == "dev" ? true : false
}