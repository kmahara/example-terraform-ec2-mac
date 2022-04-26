variable "region" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "hostname" {
  type = string
}

variable "desktop_picture_path" {
  type = string
}

variable "ssh_pubkey" {
  type = string
}

variable "allow_ipv4_cidrs" {
  type = list(string)
}

variable "name" {
  type = string
}
