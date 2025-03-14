# clean docker env
docker system prune -a
docker volume prune
# alternative
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)

# grep
grep -r "my_search_string" . --exclude-dir=/path/to/directory

# Enable nested virtualization: https://docs.fedoraproject.org/en-US/quick-docs/using-nested-virtualization-in-kvm/
# check if it is enabled: cat /sys/module/kvm_amd/parameters/nested
sudo modprobe -r kvm_amd # sudo modprobe -r kvm_intel
sudo modprobe kvm_amd nested=1 # sudo modprobe kvm_intel nested=1
bat /sys/module/kvm_amd/parameters/nested # bat /sys/module/kvm_intel/parameters/nested

sudo echo "options kvm_amd nested=1" >> /etc/modprobe.d/kvm.conf # sudo echo "options kvm_intel nested=1" >> /etc/modprobe.d/kvm_intel.conf

sudo yay -S qemu virt-manager libvirt virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables libguestfs ovmf swtpm iptables-nft exfatprogs qemu-fullitor

sudo systemctl enable --now libvirtd

sudo systemctl status libvirtd

# Uncomment the option "unix_sock_group" and enter the group name as "libvirt" => unix_sock_group = "libvirt"
# uncomment the option "unix_sock_rw_perms" and leave the permission as default "0770" => unix_sock_rw_perms = "0770"
sudoedit /etc/libvirt/libvirtd.conf

sudo usermod -a -G libvirt $USER #restart after this

### If you want to put windows 11 on a VM you need to enable TPM on KVM
# follow instructions here: https://getlabsdone.com/how-to-install-windows-11-on-kvm/
yay -S swtpm --noconfirm

#######################
# :: iptables-nft and iptables are in conflict. Remove iptables? [y/N] y
# :: exfatprogs and exfat-utils are in conflict. Remove exfat-utils? [y/N] y
######################



#### When installing a windows vm:
After instaltion, download the spice-guest-tools-latest and install
# https://spice-space.org/download/windows/spice-guest-tools/
# download virtio drivers

# vm config:
# cpu: 1 socket, 6 cores, 2 threads
# memory: 32768
# create another sata cdrom, mount the virtio
# virtual network: 'default': NAT, device model: e1000e
# video: QXL



# samba client
# on the server: https://techviewleo.com/configure-samba-share-on-arch-manjaro-garuda/
yay -S samba smbclient
sudo vim /etc/samba/smb.conf

# Global parameters: paste it in the file just opened
[global]
	dns proxy = No
	log file = /var/log/samba/%m.log
	max log size = 50
	server role = standalone server
	server string = Samba Server
	workgroup = MYGROUP
	idmap config * : backend = tdb

[homes]
   comment = Home Directories
   browseable = no
   writable = yes

[LinuxHost]
  comment = Host Share
  path = /home/sodre/Theorem/Shared
  valid users = sodre
  public = no
  writable = yes
  printable = no


yay -S cifs-utils smbclient
smbclient //192.168.0.30/LinuxHost -U sodre

# mount permanently
sudo mkdir -p /mnt/shares
sudo mount -t cifs -o username=sodre //192.168.0.30/LinuxHost /mnt/shares

//192.168.0.30/LinuxHost  /mnt/shared cifs credentials=/.sambacreds 0 0
//192.168.0.30/LinuxHost  /mnt/shared cifs username=sodre,password=mypassword,noperm 0 0
alias opensamba='sudo mount -a'


## Test ssd speed
lsblk
sudo hdparm -Tt /dev/nvme0n1

# ignore file only on your local repository
git update-index --assume-unchanged relative/path/from/root/repo

## on Konsole
# edit current profile -> keyboard -> "Return+shift" = \r\E[H\E\x7fa

#### Show router ip
ip route show | grep -i 'default via'| awk '{print $3 }'
