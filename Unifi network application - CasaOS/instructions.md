# Unifi Network Application for CasaOS

### Preliminary info

This deployment requires a 64bit architecture.
unifi-network-application can be fairly memory hungry (I’ve seen it go up to 700MB of memory usage), keep it in mind when deploying on small memory devices (in such case, I suggest you take a look at DietPi and the relative implementation in this repo).

### Instructions

- if you want, change the default password for mongodb both in the compose and init-mongo.js files
- place the `init-mongo.js` file in the `/DATA/AppData` folder
- Deploy as a custom install (press + on the top right corner, then “install a customized app” and then import, at the top of the window).
- Wait a few minutes for the unifi-network-application to initialize, dashboard will be available on port 8443.

### After install

Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.

### Choices

MongoDB uses version 3.6 because it is the latest version supported by ARMv8-A devices (like Raspberry Pis), feel free to use version up to 4.4 if you are using compatible architectures.

### Extra

Some of the ports used by the container are optional. \
For more information on the unifi-network-application image, visit [here](https://docs.linuxserver.io/images/docker-unifi-network-application/). \
For tips on managing Ubiquiti devices, like connecting via SSH to APs, take a look at the cheat sheet in this repo.
