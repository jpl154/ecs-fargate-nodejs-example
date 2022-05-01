variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "qa", "stage", "prod"], var.environment)
    error_message = "Invalid value given. Allowed Values:[\"dev\",\"qa\",\"stage\",\"prod\"]."
  }
}

variable "owner" {
  type    = string
  default = "Joseph LaCava"
}

# Not adding validation due to complex type.
variable "optional_tags" {
  type = map(string)
  default = {
    business_unit = "demo"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"

  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.region))
    error_message = "Must be valid AWS Region names."
  }
}

variable "image" {
  type    = string
  default = "jpl4k/nginx-calculator:master"
}

variable "container_port" {
  type    = string
  default = "3000"
}

variable "container_cpu" {
  type    = number
  default = 1024
}

variable "container_mem" {
  type    = number
  default = 2048
}

variable "app_name" {
  type    = string
  default = "calculator"
}