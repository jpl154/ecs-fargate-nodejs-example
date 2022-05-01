locals {

    required_tags = {
        environment = var.environment
        created_by = var.owner
    }

    tags = merge(local.required_tags, var.optional_tags)

}