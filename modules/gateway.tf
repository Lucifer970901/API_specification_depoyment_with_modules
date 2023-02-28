
data "local_file" "api_description_file" {
    filename = "./data/openapi.yaml"
    #filename =  "../../data/openapi.yaml"
}

locals {
    api_description = yamldecode(data.local_file.api_description_file.content)
}


resource "oci_apigateway_api" "this" {
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

