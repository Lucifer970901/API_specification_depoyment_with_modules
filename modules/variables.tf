variable "compartment_id"{}
variable "gateway_endpoint_type" {}
variable   "subnet_id" {}

variable "function_id" {
    type = string
}

variable "logging_level" {
  default = "ERROR"
}
