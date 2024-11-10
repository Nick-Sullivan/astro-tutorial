terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
  backend "s3" {
    bucket = "nicks-terraform-states"
    key    = "astro_experiment/infrastructure/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

locals {
  prefix_parameter = "/AstroExperiment/production"
  url              = "nicksastroexperiment.com"
  url_www          = "www.${local.url}"
  # build_folder     = "${path.root}/../../docs/_site" # Generated as part of build
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

