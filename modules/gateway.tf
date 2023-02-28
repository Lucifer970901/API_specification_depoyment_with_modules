resource "oci_apigateway_gateway" "gateway" {
    #Required
    compartment_id = "${var.compartment_id}"
    endpoint_type = "${var.gateway_endpoint_type}"
    subnet_id = "${var.subnet_id}"
    display_name = "API_gateway"
    timeouts {
        
    create = "30m"
    update = "20m"
    delete = "5m"
   
  }
}
data "local_file" "api_description_file" {
    filename = "./data/openapi.yaml"
    #filename =  "../../data/openapi.yaml"
}

locals {
    api_description = yamldecode(data.local_file.api_description_file.content)
}


resource "oci_apigateway_api" "this" {
   # for_each = fileset("${path.module},../../data/openapi.yaml", "*.yaml")
    #compartment_id = var.compartment_ids[each.value.compartment_name]
    #content = file("${path.module}/openapi/${each.value}")
    #display_name = yamldecode(file("${path.module}/openapi/${each.value}")).info.title  
    compartment_id = "${var.compartment_id}"
    content = data.local_file.api_description_file.content
    display_name = local.api_description.info.title
  
}
  locals {
  backend_types = {
    function       = "ORACLE_FUNCTIONS_BACKEND"
    http           = "HTTP_BACKEND"
    stock_response = "STOCK_RESPONSE_BACKEND"
  }
}

