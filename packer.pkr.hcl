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
  
  boot_command = [
    "<wait>c",
    "linux /casper/vmlinuz quiet ip=192.168.220.20::192.168.220.1:255.255.255.0::::192.168.220.2  autoinstall ds=nocloud-net\\;s=http://192.168.220.7/ ---<wait>",
    "<enter><wait10s>",
    "initrd /casper/initrd",
    "<enter><wait15s>",
    "<wait>boot<wait><enter>"
  ]  
  #   boot_command = [
  #   "<esc><esc><enter>",
  #   "/install/vmlinuz ",
  #   "noapic ",
  #   "preseed/url=http://192.168.220.7/ ",
  #   "debian-installer=en_US ",
  #   "auto ",
  #   "locale=en_US ",
  #   "kbd-chooser/method=us ",
  #   "hostname=ubuntu-auto-inst ",
  #   "fb=false ",
  #   "debconf/frontend=noninteractive ",
  #   "keyboard-configuration/modelcode=SKIP ",
  #   "keyboard-configuration/layout=USA ",
  #   "keyboard-configuration/variant=USA ",
  #   "keyboard-configuration/options= ",
  #   "ip=192.168.220.20::192.168.220.1:255.255.255.0::ubuntu-auto-int:none ",
  #   "<enter>"
  # ]
  boot                      = "c"
  boot_wait                 = "5s"
  ssh_username              = "amad"
  ssh_password              = "$6$oyKhvXCtMZdJXqob$3sbwPb1/QtQVLxa2uT/vaic2qgvZ6G4Ff2lqmb9mec9pYsPrxMscByfxY2MN/x4YWYiQS17Go6CZ8Gmt.ciB6."
  ssh_timeout               = "20m"
  ssh_host                  = "192.168.220.20"
  ssh_clear_authorized_keys = true
  ssh_port                  = 22
  ssh_certificate_file      = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKTU4LbNRT7d441d9SA5yCzyUnSzveXs+aXUFgVcSN/TJ880HKoINpJGml1IoAIRbRIM5na8OUgNflPungvYHlY= user-ansible@ansible"

# boot_command = [
#   # Appuyer sur la touche "Entrée" pour commencer le processus de démarrage
#   "<enter><wait>",
#   # Spécifier l'adresse IP, le masque de sous-réseau, la passerelle et le DNS à utiliser pour la machine virtuelle
#   "ip=192.168.220.20",
#   "netmask=255.255.255.0",
#   "gateway=192.168.220.1",
#   "dns=192.168.220.2",
#   # Spécifier le noyau Linux à utiliser pour l'installation
#   "/install/vmlinuz",
#   # Désactiver le support pour l'APIC (Advanced Programmable Interrupt Controller)
#   "noapic",
#   # Spécifier l'URL du fichier user-data contenant les informations de configuration
#   "ds=nocloud-net;s=http://192.168.220.7/",
#   # Activer l'installation automatique
#   "auto=true",
#   # Spécifier la priorité de l'installation
#   "priority=critical",
#   # Configurer la langue par défaut en anglais
#   "debian-installer/locale=en_US",
#   # Désactiver la détection automatique de la configuration de la console
#   "console-setup/ask_detect=false",
#   # Configurer la disposition du clavier pour un clavier français (azerty)
#   "keyboard-configuration/xkb-keymap=fr",
#   "console-keymaps-at/keymap=fr",
#   # Appuyer sur la touche "Entrée" pour lancer l'installation
#   "<enter><wait>"
# ]

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
}
