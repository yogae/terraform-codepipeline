variable "pipeline_name" {
    type = string
}

variable "artifact_s3_bucket" {
    type = string
}

variable "artifact_s3_key" {
    type = string
}

variable "codebuild_project_name" {
    type = string
}

variable "codedeploy_app_name" {
    type = string
}

variable "codedeploy_deployment_group_name" {
    type = string
}

variable "codebuild_source" {
    type = map
}
