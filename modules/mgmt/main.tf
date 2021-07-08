terraform {
  required_version = ">= 1.0.0, < 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.42.0, < 3.43.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
