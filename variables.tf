provider "aws" {
  region = var.region
}

variable "ecr_name" {
  default = ""
}

variable "env" {
  default = "dev"
}

variable "region" {
  default = "us-east-1"
}