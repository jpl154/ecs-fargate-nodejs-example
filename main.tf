
#
#   Standard reqirements for a 
#

provider "aws" {
    region = "us-east-1"
}

resource "random_pet" "name" {
    prefix = "demo"
    length = 1
}


## Create VPC

module "quickstart_vpc" {
    source = "./modules/quickstart_vpc"
    region = var.region
    name   = "${random_pet.name.id}"
    cidr     = "10.0.0.0/16"
    public_subnets      = ["10.0.0.0/24", "10.0.1.0/24"]
    private_subnets_A   = ["10.0.2.0/24", "10.0.3.0/24"]
    owner = var.owner
    environment = var.environment
}

## Create Fargate ECS Cluster
module "fargate" {
    depends_on = [module.quickstart_vpc]
    source = "./modules/fargate"
    region = var.region
    name   = "${random_pet.name.id}"   
    owner = var.owner
    environment = var.environment
}
