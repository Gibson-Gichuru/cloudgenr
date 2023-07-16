variable "instance_size" {
  description = "Instance size for EKS managed node groups"
  type        = string
  default     = "t2.micro"
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Resource tags "
}
