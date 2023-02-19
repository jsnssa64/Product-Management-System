variable "filename" {
    default = "/root/pets.txt"
}

variable "usernames" {
    type = list
    default = [
        "JasonSo",
        "JackDon",
        12
    ]
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default="eu-west-1"
}