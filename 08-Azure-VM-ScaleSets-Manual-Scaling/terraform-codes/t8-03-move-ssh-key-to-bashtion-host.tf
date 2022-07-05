# Create a null resource and providers
resource "null_resource" "null_copy_ssh_key_to_bastion" {
depends_on = [azurerm_linux_virtual_machine.baston_host_linuxvm]
#connection block for provisioners to connect with Azure VM Instance
connection {
  type = "ssh"
  host = azurerm_linux_virtual_machine.baston_host_linuxvm.public_ip_address
  user = azurerm_linux_virtual_machine.baston_host_linuxvm.admin_username
  private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
}
# file provisioner: copies the terraform-key.pem file to /tmp/terraform-key.pem
provisioner "file" {
  source = "ssh-keys/terraform-azure.pem"
  destination = "/tmp/terraform-azure.pem"
}
# Remote Exec provisioner to grant permission to private key on bastion host
provisioner "remote-exec" {
inline = [ "sudo chmod 400 /tmp/terraform-azure.pem"]
  }
}
