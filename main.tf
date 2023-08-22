# Create public IPs
resource "azurerm_public_ip" "my_public_ip" {
  name                = "my-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Create network interface
resource "azurerm_network_interface" "vmnic" {
  name                = var.vmnic
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = var.vmsubnetid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "securitygroup" {
  network_interface_id      = azurerm_network_interface.vmnic.id
  network_security_group_id = var.nsgid
}

resource "azurerm_windows_virtual_machine" "myvm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmnic.id]
  size               = "Standard_DS1_v2"
  admin_username = "testadmin"
    admin_password = "Password1234!"


  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
  os_disk {
    name              = "myosdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
    
  }
}