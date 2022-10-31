provider "aws" {
    region = "eu-west-1"
    shared_credentials_files = ["/home/anil/.aws/credentials"]
#    profile                 = "profile_name"
#    access_key = ""
#    secret_key = ""
}

data "aws_availability_zones" "azs" {
    state = "available"
}