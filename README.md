<h1 align=center>Easily deploy Unifi Network Application, on Docker 🐳</h1>

![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2FGiuseppeGalilei%2FUnifi-Network-Application&label=Visitors&countColor=%23263759)
<a href="https://buymeacoffee.com/giuseppegalilei" title="Buy me a coffee">
  <img src="https://img.shields.io/badge/Buy%20me%20a%20coffee-€%203-blue?logo=buy-me-a-coffee&style=for-the-badge" alt="Buy me a coffee" style="display: inline-block" />
</a>

## The easy way, OneLiner install! (BETA, feedback is appreciated)
```bash

wget -O install.sh https://raw.githubusercontent.com/GiuseppeGalilei/Unifi-Network-Application/main/OneLiner/install.sh && chmod +x install.sh && ./install.sh

```
Just copy and paste this command in your terminal, an intuitive script will guide you through the process

<h3 align=center> Watch the demo on Youtube: https://www.youtube.com/watch?v=AEg99KGtOFY </h3>

## The classic way, Raw compose files with instructions
You can find:
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on a **Generic System**, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on **DietPi** systems, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) through **CasaOS**, along with instructions
- 📔 **Cheat Sheet** about random Ubiquiti stuff

### After install

Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.

### Development
Feel free to raise issues and share your insights.
You can also join a more "relaxed" discussion on [Reddit](https://www.reddit.com/r/Ubiquiti/comments/18stenb/unifi_network_application_easy_docker_deployment/).

### Common issue
Sometimes the unifi-network-application will start before the db is ready, this stops the starting process.
To solve this, just restart the network application container.

### For CasaOS users:
The [Pull Request](https://github.com/IceWhaleTech/CasaOS-AppStore/pull/374) I created got merged!!
Now you can easily deploy the Unifi Network Application from the official **CasaOS AppStore**.🤩
