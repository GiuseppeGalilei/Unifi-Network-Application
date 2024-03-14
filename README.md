<h1 align=center>Easily deploy Unifi Network Application, on Docker 🐳</h1>

## The easy way, OneLiner install!
```bash

wget -O install.sh https://raw.githubusercontent.com/GiuseppeGalilei/Unifi-Network-Application/main/OneLiner/install.sh && chmod +x install.sh && ./install.sh

```
Just copy and paste this command in your terminal, an intuitive script will guide you through the process

## The classic way, Raw compose files with instructions
You can find:
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on a **Generic System**, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on **DietPi** systems, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) through **CasaOS**, along with instructions
- 📔 **Cheat Sheet** about random Ubiquiti stuff

### Development
Feel free to raise issues and share your insights.
You can also join a more "relaxed" discussion on [Reddit](https://www.reddit.com/r/Ubiquiti/comments/18stenb/unifi_network_application_easy_docker_deployment/).

### Common issue
Sometimes the unifi-network-application will start before the db is ready, this stops the starting process.
To solve this, just restart the network application container.

### For CasaOS users:
The [Pull Request](https://github.com/IceWhaleTech/CasaOS-AppStore/pull/374) I created got merged!!
Now you can easily deploy the Unifi Network Application from the official **CasaOS AppStore**.🤩
