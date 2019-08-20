module "svn_codebuild" {
  source = "git@github.com:yogae/terraform-codebuild.git"

  vpc_id = "${var.vpc_id}"
  subnets = "${var.subnets}"
  security_group_ids = "${var.security_group_ids}"
  codebuild_source = "${var.codebuild_source}"
  codebuild_s3_bucket_name = "${var.codebuild_s3_bucket_name}"
  codebuild_name = "${var.codebuild_name}"
}


module "svn_codeploy" {
  source = "git@github.com:yogae/terrform-code-deploy.git"

  vpc_id = "${var.vpc_id}"
  subnets = "${var.subnets}"
  alb_name = "${var.alb_name}"
  instance_group_name = "${var.instance_group_name}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  launch_config_aws_ami = "${var.launch_config_aws_ami}"
  deploy_s3_bucket = "${var.deploy_s3_bucket}"
  codedeploy_application_name = "${var.codedeploy_application_name}"
  codedeploy_deployment_group_name = "${var.codedeploy_deployment_group_name}"
}

module "svn_pipeline" {
  source = "./lib/codepipeline"
  
  codebuild_source = "${var.codebuild_source}"
  pipeline_name = "${var.cadepipeline_name}"
  artifact_s3_bucket = "${var.deploy_s3_bucket}"
  artifact_s3_key = "${var.deploy_s3_key}"
  codebuild_project_name = "${module.svn_codebuild.codebuild_project_name}"
  codedeploy_app_name = "${module.svn_codeploy.codedeploy_app_name}"
  codedeploy_deployment_group_name = "${module.svn_codeploy.codedeploy_deployment_group_name}"
}
