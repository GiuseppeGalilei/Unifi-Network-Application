# Unifi Network Application

You can find:
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on a **Generic System**, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on **DietPi** systems, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) through **CasaOS**, along with instructions
- 📔 **Cheat Sheet** about random Ubiquiti stuff

Feel free to raise issues and share your insights.
You can also join a more "relaxed" discussion on [Reddit](https://www.reddit.com/r/Ubiquiti/comments/18stenb/unifi_network_application_easy_docker_deployment/).

### Common issue
Sometimes the unifi-network-application will start before the db is ready, this stops the starting process.
To solve this, just restart the network application container.

### For CasaOS users:
The [Pull Request](https://github.com/IceWhaleTech/CasaOS-AppStore/pull/374) I created got merged!!
Now you can easily deploy the Unifi Network Application from the official **CasaOS AppStore**.🤩
