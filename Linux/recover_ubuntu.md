
#### System file removed after sudo apt-get remove python??

Firstly, since I can't connect to the Internet I run the following command:

```sudo dhclient -r;sudo dhclient ```

And now it is connected. After that, just follow these steps:
```bash
sudo apt --fix-broken install
sudo apt install ubuntu-minimal
sudo apt install ubuntu-desktop
sudo apt install ubuntu-standard meta-package
```
