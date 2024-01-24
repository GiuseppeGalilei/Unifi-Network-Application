# Unifi Network Application for DietPi

### Preliminary info

This deployment requires a 64bit architecture and a Docker-compose version >2.23.1, in case you are using an older version refer to the old guide.
unifi-network-application can be fairly memory hungry (I’ve seen it go up to 1.2G of memory usage), keep it in mind when deploying on small memory devices.

### Instructions

This implementation requires Docker, Docker-compose (version >2.23.1) to be installed

1. if you want, change the default password for MongoDB in the compose
2. create the `unifi-db` and `unifi-network-application` folders in a path of your choice
3. you should get this folder structure

```markdown
├── CHOOSE-A-PATH
│   ├── unifi-db
│   ├── unifi-network-application
```

4. Deploy
5. Wait a few minutes for the unifi-network-application to initialize, dashboard will be available on port 8443.

### After install

Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.

### Troubleshoot

- If running on a memory constrained device, you can try to set some limits.
  Results may vary.
  If you are using a SBC I suggest you try DietPi OS and the relative compose I wrote. (this way, I managed to run the network application on a Raspberry Pi 3 with just 1G of RAM)

### Choices

MongoDB uses version 3.6 because it is the latest version supported by ARMv8-A devices (like Raspberry Pis), feel free to use version up to 4.4 if you are using compatible architectures.

### Extra

Some of the ports used by the container are optional. \
For more information on the unifi-network-application image, visit [here](https://docs.linuxserver.io/images/docker-unifi-network-application/). \
For tips on managing Ubiquiti devices, like connecting via SSH to APs, take a look at the cheat sheet in this repo.
