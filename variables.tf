variable "environment" {
    type = string
    default = "dev"

    validation {
        condition = contains(["dev","qa","stage","prod"], var.environment)
        error_message = "Invalid value given. Allowed Values:[\"dev\",\"qa\",\"stage\",\"prod\"]."
    }
}

variable "owner" {
    type = string
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
  type = string
  default = "us-east-1"

  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.region))
    error_message = "Must be valid AWS Region names."
  }
}