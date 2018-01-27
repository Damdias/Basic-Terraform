variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
    default = "terraformtest"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "us-east-1"
}


resource "aws_instance" "Sqlserver" {
    ami = "ami-0a9fac70"
    instance_type = "t2.medium"
    
 key_name = "${var.key_name}"

  

    connection {
        user ="ubuntu"
        private_key = "${file(var.private_key_path)}"

    }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

provisioner "remote-exec" {
    inline = [
       "bash /tmp/script.sh"

    ]
}
}
output "aws_instance_public_dns" {
    value = "${aws_instance.Sqlserver.public_dns}"
}
