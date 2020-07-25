region = "us-east-1"

availability_zones = ["us-east-1a"]

namespace = "eg"

stage = "test"

# name will be passed in by terratest, see 'examples_complete_test.go'
//name = "emr-test"

ebs_root_volume_size = 10

visible_to_all_users = true

release_label = "emr-5.25.0"

applications = ["Hive", "Presto"]

core_instance_group_instance_type = "c4.large"

core_instance_group_instance_count = 1

core_instance_group_ebs_size = 10

core_instance_group_ebs_type = "gp2"

core_instance_group_ebs_volumes_per_instance = 1

master_instance_group_instance_type = "c4.large"

master_instance_group_instance_count = 1

master_instance_group_ebs_size = 10

master_instance_group_ebs_type = "gp2"

master_instance_group_ebs_volumes_per_instance = 1

create_task_instance_group = false

ssh_public_key_path = "/secrets"

generate_ssh_key = true

vpc_id = "vpc-15f3506d"

subnet_id = "subnet-b6605dba"

route_table_id = "tb-da0047a0"

allowed_sg_group = ["sg-69c0901b"]

managed_master_sg = "testsg"                            

label_service_managed = "testservice"                  

label_slave_managed = "test_slaved"

label_master = "test_label_master"

label_slave = "test_slave"

label_emr = "test_emr"

label_ec2 = "test_ec2"

label_ec2_autoscaling = "test_autoscaling"

emr_cluster_name = "test_cluster_name"

label_core = "test_label_core"

label_task = "test_label_task"