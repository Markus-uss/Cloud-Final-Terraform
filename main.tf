terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.region
}

module "custom_vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr

  lb_pub_sub_1 = "172.31.1.0/24"
  lb_pub_sub_2 = "172.31.2.0/24"
  lb_pub_sub_3 = "172.31.3.0/24"

  lb_pri_sub_1 = "172.31.4.0/24"
  lb_pri_sub_2 = "172.31.5.0/24"
  lb_pri_sub_3 = "172.31.6.0/24"

  app_pri_sub_1 = "172.31.7.0/24"
  app_pri_sub_2 = "172.31.8.0/24"
  app_pri_sub_3 = "172.31.9.0/24"

  az_1 = "${var.region}a"
  az_2 = "${var.region}b"
  az_3 = "${var.region}c"
}