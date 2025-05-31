variable "db_username" {
    type = string
    sensitive = true
  
}

variable "db_password" {
    type = string
    sensitive = true
  
}

variable "my_ip" {
    description = "Your IP address"
    type = string 
}