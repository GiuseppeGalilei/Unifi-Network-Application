## This script guides you through the process of deploying Unifi Network Application, on Docker.
To use it, just copy and paste the following command in your terminal
```bash

wget -O install.sh https://raw.githubusercontent.com/GiuseppeGalilei/Unifi-Network-Application/main/OneLiner/install.sh && chmod +x install.sh && ./install.sh

```
### After install

Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.


### Choices
To make the script work in almost all scenarios, conservative default choices were made.
- mongoDB version: 3.6 (to be compatible with older devices, especially raspberry Pis)
- no memory limits
In the future I'll update the script to allow for more customisability, feel free to share ideas!

### For an explanation about how the script works go through the install.sh file, I tried to put all the relevant information in the comments.
