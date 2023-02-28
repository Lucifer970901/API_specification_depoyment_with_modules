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

resource "oci_apigateway_deployment" "service_deployment" {
    #Required
    compartment_id = "${var.compartment_id}"
    gateway_id = module.gateway.gateway_id_output
    #gateway_id    oci_apigateway_gateway.gateway.id
    path_prefix = local.api_description.basePath
    specification {

        #Optional
        logging_policies {

            #Optional
            access_log {

                #Optional
                is_enabled = true
            }
            execution_log {

                #Optional
                is_enabled = true
                log_level = var.logging_level
            }
        }
        request_policies {

#         rate_limiting {
#            # Required
#            rate_in_requests_per_second = "${var.deployment_specification_request_policies_rate_limiting_rate_in_requests_per_second}"
#            rate_key = "${var.deployment_specification_request_policies_rate_limiting_rate_key}"
#            }
        }
        routes {
            #Required
            backend {
                #Required
                type = "ORACLE_FUNCTIONS_BACKEND"

                #Optional
                function_id = "${var.function_id}"
                connect_timeout_in_seconds = "5"
                read_timeout_in_seconds = "5"
                send_timeout_in_seconds = "5"
            }
            path = "/pet"

            #Optional
            logging_policies {

                #Optional
                access_log {

                    #Optional
                    is_enabled = true
                }
                execution_log {

                    #Optional
                    is_enabled = true
                    log_level = var.logging_level
                }
            }
            methods = ["GET"]
        }
    }
    display_name = local.api_description.info.title
  }

