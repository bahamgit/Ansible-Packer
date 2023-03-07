# Resource Definiation for the VM Template
source "vsphere-iso" "vm-packer" {
  # Partie pour s'identifier
  vcenter_server      = "192.168.220.102"
  username            = "administrator@vsphere.palladu38.me"
  password            = "Sdfgh123$"
  insecure_connection = true

  # Enveloppe de la VM
  vm_name = "Amad - Auto-Inst-Ubu"
  # folder  = "Temp"
  # cluster = ""
  host      = "37.187.132.7"
  datastore = "STORAGE_Amad"
  # set_host_for_datastore_uploads = ""

  # Hardware configuration
  CPUs         = "1"
  # cpu_cores    = "2"
  CPU_hot_plug = true
  RAM          = "4096"
  RAM_hot_plug = true
  
  # Netwotf configuration
  network_adapters {
      network = "Amad - DMZ"
      network_card = "vmxnet3"
  }
  # Creation disk
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size = 15000
    disk_controller_index = 0
}


  # ISO configuration
  iso_checksum = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
  iso_url      = "https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
  
  # Pour la connexion ssh
  ssh_host = "192.168.220.103"
  ssh_username = "amad"
  ssh_password = "amad"
}

# Build Definition to create the VM Template
build {

  name    = "vm creation"
  sources = ["source.vsphere-iso.vm-packer"]
}

