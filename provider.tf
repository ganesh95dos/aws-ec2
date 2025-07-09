provider "aws" {
    region = "ap-south-1"
}

#for output.tf showing region
data "aws_region" "current" {}
