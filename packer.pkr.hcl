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
  
  
#  # VM Cloud-Init Settings
#  user_data_file = "user_data.j2"
#  cloud_init              = true
#  cloud_init_storage_pool = "{{ local }}"
 
boot_command = [
  # Appuyer sur la touche "Entrée" pour commencer le processus de démarrage
  "<enter><wait>",
  # Spécifier l'adresse IP, le masque de sous-réseau, la passerelle et le DNS à utiliser pour la machine virtuelle
  "ip=192.168.220.20",
  "netmask=255.255.255.0",
  "gateway=192.168.220.1",
  "dns=192.168.220.2",
  # Spécifier le noyau Linux à utiliser pour l'installation
  "/install/vmlinuz",
  # Désactiver le support pour l'APIC (Advanced Programmable Interrupt Controller)
  "noapic",
  # Spécifier l'URL du fichier user-data contenant les informations de configuration
  "ds=nocloud-net;s=http://192.168.220.7/",
  # Activer l'installation automatique
  "auto=true",
  # Spécifier la priorité de l'installation
  "priority=critical",
  # Configurer la langue par défaut en anglais
  "debian-installer/locale=en_US",
  # Désactiver la détection automatique de la configuration de la console
  "console-setup/ask_detect=false",
  # Configurer la disposition du clavier pour un clavier français (azerty)
  "keyboard-configuration/xkb-keymap=fr",
  "console-keymaps-at/keymap=fr",
  # Appuyer sur la touche "Entrée" pour lancer l'installation
  "<enter><wait>"
]

  # Pour la connexion ssh
  ssh_host = "192.168.220.20"
  ssh_username = "amad"
  ssh_password = "sdfgh"
}

  # PACKER Boot Commands

# Build Definition to create the VM Template
build {

  name    = "vm creation"
  sources = ["source.vsphere-iso.vm-packer"]

#   provisioner "file" {
#     source      = "user-data.j2"    # fichier de configuration cloud-init
#     destination = "/tmp/user-data.j2"
#   }


}

