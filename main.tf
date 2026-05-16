terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "main" {
  name = "modernization-cluster"
}

resource "aws_ecr_repository" "app" {
  name = "java-modernization-demo"
}

resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/java-modernization-demo"
  retention_in_days = 7
}
