module "gateway" {
   source = "./modules"
    compartment_id = var.compartment_id
    gateway_endpoint_type = var.gateway_endpoint_type
    subnet_id = var.subnet_id
    gateway_id = module.gateway.gateway_id_output
}
