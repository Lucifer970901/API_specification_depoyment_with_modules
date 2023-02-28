output "apis" {
    value = oci_apigateway_api.this.id
}
output "gateway_id_output"{
description = "gateway ID"
value = oci_apigateway_gateway.gateway.id
}
