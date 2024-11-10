# Infrastructure that takes a long time to change.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
  backend "s3" {
    bucket = "nicks-terraform-states"
    key    = "astro_experiment/foundation/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

locals {
  prefix_parameter = "/AstroExperiment/production"
  tags = {
    Project     = "Astro Experiment"
    Environment = "production"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  default_tags {
    tags = local.tags
  }
}

