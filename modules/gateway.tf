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
