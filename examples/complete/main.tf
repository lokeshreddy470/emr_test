provider "aws" {
  region = var.region
}

# module "vpc" {
#   source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.7.0"
#   namespace  = var.namespace
#   stage      = var.stage
#   name       = var.name
#   cidr_block = "172.16.0.0/16"
# }

# module "subnets" {
#   source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.16.0"
#   availability_zones   = var.availability_zones
#   namespace            = var.namespace
#   stage                = var.stage
#   name                 = var.name
#   vpc_id               = module.vpc.vpc_id
#   igw_id               = module.vpc.igw_id
#   cidr_block           = module.vpc.vpc_cidr_block
#   nat_gateway_enabled  = false
#   nat_instance_enabled = false
# }

#module "s3_log_storage" {
#  source        = "git::https://github.com/cloudposse/terraform-aws-s3-log-storage.git?ref=tags/0.5.0"
#  region        = var.region
#  namespace     = var.namespace
#  stage         = var.stage
#  name          = var.name
#  attributes    = ["logs"]
#  force_destroy = true
#}

#module "aws_key_pair" {
#  source              = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=tags/0.4.0"
#  namespace           = var.namespace
#  stage               = var.stage
#  name                = var.name
#  attributes          = ["ssh", "key"]
#  ssh_public_key_path = var.ssh_public_key_path
#  generate_ssh_key    = var.generate_ssh_key
#}

module "emr_cluster" {
  source                                         = "../../"
  namespace                                      = var.namespace
  stage                                          = var.stage
  name                                           = var.name
  master_allowed_security_groups                 = var.allowed_sg_group
  slave_allowed_security_groups                  = var.allowed_sg_group
  region                                         = var.region
  vpc_id                                         = var.vpc_id
  subnet_id                                      = var.subnet_id
  route_table_id                                 = var.route_table_id
  subnet_type                                    = "private"
  ebs_root_volume_size                           = var.ebs_root_volume_size
  visible_to_all_users                           = var.visible_to_all_users
  release_label                                  = var.release_label
  applications                                   = var.applications
  configurations_json                            = var.configurations_json
  core_instance_group_instance_type              = var.core_instance_group_instance_type
  core_instance_group_instance_count             = var.core_instance_group_instance_count
  core_instance_group_ebs_size                   = var.core_instance_group_ebs_size
  core_instance_group_ebs_type                   = var.core_instance_group_ebs_type
  core_instance_group_ebs_volumes_per_instance   = var.core_instance_group_ebs_volumes_per_instance
  master_instance_group_instance_type            = var.master_instance_group_instance_type
  master_instance_group_instance_count           = var.master_instance_group_instance_count
  master_instance_group_ebs_size                 = var.master_instance_group_ebs_size
  master_instance_group_ebs_type                 = var.master_instance_group_ebs_type
  master_instance_group_ebs_volumes_per_instance = var.master_instance_group_ebs_volumes_per_instance
  create_task_instance_group                     = var.create_task_instance_group
  managed_master_sg                              = var.managed_master_sg
  label_service_managed                          = var.label_service_managed
  label_slave_managed                            = var.label_slave_managed
  label_master                                   = var.label_master
  label_slave                                    = var.label_slave
  label_emr                                      = var.label_emr
  label_ec2                                      = var.label_ec2
  label_ec2_autoscaling                          = var.label_ec2_autoscaling
  emr_cluster_name                               = var.emr_cluster_name
  label_core                                     = var.label_core
  log_uri                                        = "s3://deletethis123"
  key_name                                       = "emr_test"
}
