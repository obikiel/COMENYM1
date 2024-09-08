# resource group variable
variable "rg" {
  type        = string
  description = "Resource group for my resources"
  default     = "comenym1rg"
}

# resource location variable
variable "location" {
  type        = string
  description = "Location for my resources: west europe"
  default     = "west europe"
}

# app service plan variable
variable "app_service_plan" {
  type        = string
  description = "my app service plan for hosting backend"
  default     = "comenym1plan"
}

# linux app service variable
variable "linux_app_service" {
  type        = string
  description = "my app name"
  default     = "comenym1backend"
}
