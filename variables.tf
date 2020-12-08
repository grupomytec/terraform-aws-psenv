variable "ssm_path" {
  type        = string
  description = "The hierarchy for the parameter."
  default     = "/"

  validation {
    condition     = substr(var.ssm_path, 0, 1) == "/"
    error_message = "The ssm_path value must start with a forward slash (/)."
  }
}

variable "value_from" {
  type        = bool
  default     = true
  description = "Use valueFrom syntax (with the parameter ARN)."
}
