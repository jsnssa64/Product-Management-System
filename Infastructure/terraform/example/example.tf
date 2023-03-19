/*    Example of lookUp = Using variable AWS_REGION:
  variable AWS_REGION 
  { 
    default = "us-east-2"
  } 
      Find matching inside map AMIS:
  variable AMIS { 
    type = map
    default = {
      us-west-1 = "" 
      us-east-2 = "" 
    }
  }

//  lookup(map-variable, key)
resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
} */

/*    Upload Files to Machines (SSH / RW) inside a resource
  resource "aws_instance" "test" {
    ..
    provisioner "file" {
      source = "app.conf"
      desintation = "/etc/myapp.conf",
      //  Connection setting(optional)
      connection {
        user = "${var.instance_username}"
        password = "${var.instance_password}"
      }
    ..
  } 
*/

/*  Execute command line with provisioner

  resource "aws_resource" "test2" {
    ..
    provisioner "remote-exec" {
      inline = [
        "chmod +x /opt/file.sh"  //  First command - Change permission to enable executeable
        "/opt/file.sh -p -f -g -e" // Second Command - Run File
      ]
    }
    ..
  }

*/