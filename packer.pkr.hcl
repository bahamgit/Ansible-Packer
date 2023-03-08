# Resource Definiation for the VM Template
source "vsphere-iso" "vm-packer" {
  # vCenter connection settings 
  vcenter_server      = "192.168.220.102"
  username            = "administrator@vsphere.palladu38.me"
  password            = "Sdfgh123$"
  insecure_connection = true

  # VM general settings 
  vm_name = "Amad - Auto-Inst-Ubu"
  # folder  = "Temp"
  # cluster = ""
  host      = "37.187.132.7"
  datastore = "STORAGE_Amad"

  # CPU settings
  CPUs         = "1"
  # cpu_cores    = "2"
  
  # Memory settings
  CPU_hot_plug = true
  RAM          = "4096"
  RAM_hot_plug = true
  
  # Network settings
  network_adapters {
    network = "Amad - DMZ"
    network_card = "vmxnet3"
  }
  
 # Hard disk settings 
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size = 40000
    disk_controller_index = 0
}

  # ISO configuration
  iso_checksum = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
  iso_url      = "https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
  
  
  # VM Cloud-Init Settings
  cloud_init              = true
  cloud_init_storage_pool = "{{ local }}"

#  # Pour la connexion ssh
#  ssh_host = "192.168.220.101"
#  ssh_username = "amad"
#  ssh_password = "sdfgh"
}

# Build Definition to create the VM Template
build {

  name    = "vm creation"
  sources = ["source.vsphere-iso.vm-packer"]
}

