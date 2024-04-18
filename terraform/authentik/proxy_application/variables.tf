variable "name" {
  type = string
}

variable "domain" {
  type = string
}

variable "slug" {
  type = string
}

variable "access_token_validity" {
  type    = number
  default = 24
}

variable "authorization_flow" {
  type = string
}

variable "newtab" {
  type    = bool
  default = true
}

variable "description" {
  type    = string
  default = ""
}
