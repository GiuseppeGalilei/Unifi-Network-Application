# Unifi Network Application for DietPi

### Preliminary info

This deployment requires a 64bit architecture.
unifi-network-application can be fairly memory hungry (I’ve seen it go up to 700MB of memory usage), keep it in mind when deploying on small memory devices.
Here, in the Compose file, I set some limits to the memory usage, feel free to tweak them as needed. With the proposed limits, I can confirm it is working on a Raspberry Pi 3 with just 1GB of RAM.

### Instructions

This implementation requires Docker, Docker-compose and Portainer to be installed, you can find them in DietPi-Software.

1. if you want, change the default password for MongoDB both in the compose and init-mongo.js files
2. create the `misc`, `unifi-db` and `unifi-network-application` folders in `/mnt/dietpi_userdata/docker-data/volumes/`
3. place the `init-mongo.js` file in the `misc` folder
4. you should get this folder structure

```markdown
├── /mnt/dietpi_userdata/docker-data/volumes/
│   ├── misc
│   │   ├── init-mongo.js
│   ├── unifi-db
│   ├── unifi-network-application
```

5. Deploy as a stack on Portainer
6. Wait a few minutes for the unifi-network-application to initialize, dashboard will be available on port 8443.

### After install

Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.

### Troubleshoot

- The `init-mongo.js` file is used **only on the very first** container startup. \
  If you forgot to correctly place the file before the first startup, I suggest you to start from scratch (delete both `unifi-db` and `unifi-network-application` containers and the content of `unifi-db` and `unifi-network-application` folders).
- The proposed memory limits are set very low to allow running on devices with as low as 1GB of RAM.
  Sometimes such limits are just too low, if your network-application slows down or lags too much for our liking, try tweaking them or just remove the limit entirely if your hardware is capable.
  (non memory limited deployments have been reported to use up to 1.2GB of RAM)

### Choices

MongoDB uses version 3.6 because it is the latest version supported by ARMv8-A devices (like Raspberry Pis), feel free to use version up to 4.4 if you are using compatible architectures.

### Extra

Some of the ports used by the container are optional. \
For more information on the unifi-network-application image, visit [here](https://docs.linuxserver.io/images/docker-unifi-network-application/). \
For tips on managing Ubiquiti devices, like connecting via SSH to APs, take a look at the cheat sheet in this repo.
