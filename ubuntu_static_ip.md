# Ubuntu Static IP Configuration
## Configure
Create a file ```01-host-only.yaml``` in ```/etc/netplan/``` with following content:
```bash
network:
version: 2
renderer: networkd
ethernets:
enp0s8: # NAT network interface name
dhcp4: no
addresses: [192.168.56.100/24]
gateway4: 192.168.1.1
nameservers:
addresses: [192.168.1.1, 8.8.8.8]
```
## Save the file and apply your changes:
```
$ sudo netplan generate
$ sudo netplan apply
```
