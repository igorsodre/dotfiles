# clean docker env
docker system prune -a
docker volume prune
# alternative
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)


# Enable nested virtualization

sudo modprobe -r kvm_amd
sudo modprobe kvm_amd nested=1
cat /sys/module/kvm_amd/parameters/nested

sudo echo "options kvm_amd nested=1" >> /etc/modprobe.d/kvm.conf

sudo yay -S qemu virt-manager libvirt virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables libguestfs

sudo systemctl enable --now libvirtd

sudo systemctl status libvirtd

# Uncomment the option "unix_sock_group" and enter the group name as "libvirt" => unix_sock_group = "libvirt"
# uncomment the option "unix_sock_rw_perms" and leave the permission as default "0770" => unix_sock_rw_perms = "0770"
sudo vim /etc/libvirt/libvirtd.conf

sudo usermod -a -G libvirt $USER

#######################
# :: iptables-nft and iptables are in conflict. Remove iptables? [y/N] y
# :: exfatprogs and exfat-utils are in conflict. Remove exfat-utils? [y/N] y
######################
