# ------------------------------------------------------------------------------
# Generic Variables
# ------------------------------------------------------------------------------

environment             = "dev"
vpc_id                  = ""
private_subnet_ids      = [""]

# ------------------------------------------------------------------------------
# EC2 Instance
# ------------------------------------------------------------------------------

instance_count          = 2
sg_ec2_ports            = [8081,8082,8083]
instance_type           = ""
ssh_keypair             = ""
developer_ingress_src   = [""]
root_volume_type        = "gp2"
root_volume_size        = "30"

# ------------------------------------------------------------------------------
# ALB
# ------------------------------------------------------------------------------

certificate_arn         = ""
alb_sg_ingress_src      = [""]

# ------------------------------------------------------------------------------
# CloudWatch
# ------------------------------------------------------------------------------

custom_metric_namespace = "DevMuleRuntimes"

# ------------------------------------------------------------------------------
# MuleSoft
# ------------------------------------------------------------------------------

mule_version              = "4.3.0"
mule_region               = ""
mule_amc                  = ""

java_metaspace_initial    = ""
java_metaspace_max        = ""

java_memory_initial       = ""
java_memory_max           = ""