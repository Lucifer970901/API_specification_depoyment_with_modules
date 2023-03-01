module "gateway" {
   source = "./modules"
    compartment_id = var.compartment_id
    gateway_endpoint_type = var.gateway_endpoint_type
    subnet_id = var.subnet_id
   function_id = var.function_id
   #gwdeploy_params = var.gwdeploy_params
   # gateway_id = module.gateway.gateway_id_output
}
