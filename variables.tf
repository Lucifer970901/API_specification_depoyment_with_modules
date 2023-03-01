variable "tenancy_ocid" {
    type = string
}
variable "user_ocid" {
    type = string
}
variable "fingerprint" {
    type = string
}
variable "private_key_path" {
    type = string
}

### Regions
variable "region" {
    type = string
}

### Compartment
variable "compartment_id" {
    type = string
}

### Network
variable "subnet_id" {
    type = string
}

### API Details
variable "logging_level" {
    type = string
    default = "Error"
}

variable "display_name" {
    type = string
}

variable "gateway_endpoint_type" {
    type = string
    default = "PUBLIC"
}
variable "function_id" {
    type = string
}
#variable "function_ids" {
 #   type = map(string)
#}

variable "agile_lifecycle_iteration_flow" {
    type = string
    default = "Development"
}

variable "agile_lifecycle_process_flow" {
    type = string
    default = "Construction"
}

variable "consumption_lifecycle_audience" {
    type = string
    default = "internal"
}

variable "consumption_lifecycle_visibility" {
    type = string
    default = "unpublished"
}

variable "git_revision" {
    type = string
    default = null
}

#variable "gwdeploy_params" {
 # description = "API Gateway Deployment Params"
  #type = map(object({
   #   function_routes = list(object({
    #  type          = string
     # path          = string
      #methods       = list(string)
      #function_name = string
    #}))
     # }))
  #}
