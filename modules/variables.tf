variable "compartment_id"{}
variable "gateway_endpoint_type" {}
variable   "subnet_id" {}
variable "function_id" {type = map(string)}

variable "logging_level" {
  default = "ERROR"
}
