# ------------------------------------------------------------------------------
# EC2 Instance
# ------------------------------------------------------------------------------

module "ec2_mule_runtime" {
  source                                      = "./modules/ec2-mule-runtime"
  instance_count                              = var.instance_count
  namespace                                   = var.namespace
  app                                         = var.app
  environment                                 = var.environment
  vpc_id                                      = var.vpc_id
  subnets                                     = var.private_subnet_ids
  instance_type                               = var.instance_type
  ami                                         = var.ami
  sg_ec2_ports                                = var.sg_ec2_ports
  default_sg_ingress_src                      = var.default_sg_ingress_src
  developer_ingress_src                       = var.developer_ingress_src
  mgmt_ingress_src                            = var.mgmt_ingress_src
  sg_ec2_egress_ports                         = var.sg_ec2_egress_ports
  default_sg_egress_dst                       = var.default_sg_egress_dst
  ssh_keypair                                 = var.ssh_keypair
  alb_security_group_src                      = module.private_mule_alb.security_group_id
  mule_exp_port                               = var.mule_exp_port
  custom_metric_namespace                     = var.custom_metric_namespace
  mule_version                                = var.mule_version
  mule_region                                 = var.mule_region
  mule_amc                                    = var.mule_amc
  java_metaspace_initial                      = var.java_metaspace_initial
  java_metaspace_max                          = var.java_metaspace_max
  java_memory_initial                         = var.java_memory_initial
  java_memory_max                             = var.java_memory_max
  root_volume_type                            = var.root_volume_type
  root_volume_size                            = var.root_volume_size

  tags                                        = local.tags
}

# ------------------------------------------------------------------------------
# Application Load Balancer
# ------------------------------------------------------------------------------

module "private_mule_alb" {
  source                                      = "./modules/alb"
  namespace                                   = var.namespace
  app                                         = var.app
  environment                                 = var.environment
  vpc_id                                      = var.vpc_id
  subnets                                     = var.private_subnet_ids
  mule_exp_port                               = var.mule_exp_port
  ec2_security_group_id                       = module.ec2_mule_runtime.security_group_id
  default_sg_ingress_src                      = var.default_sg_ingress_src
  certificate_arn                             = var.certificate_arn
  target_instances                            = module.ec2_mule_runtime.mule_runtime_instance_ids
  instance_count                              = var.instance_count

  tags                                        = local.tags
}
