# Ubiquiti Tips and Tricks

Collection of scripts and notes about Ubiquiti gear, from an amateur networking geek.

Includes:
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on a **Generic System**, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) on **DietPi** systems, along with instructions
- 🐳 Docker compose for deploying Unifi Network Application (including mongodb) through **CasaOS**, along with instructions
- 📔 **Cheat Sheet** and notes about random Ubiquiti stuff

Feel free to raise issues and share your insights.
You can also join a more "relaxed" discussion on [Reddit](https://www.reddit.com/r/Ubiquiti/comments/18stenb/unifi_network_application_easy_docker_deployment/).

### Common issue
Sometimes the unifi-network-application will start before the db is ready, this stops the starting process.
To solve this, just restart the network application container.

### For CasaOS users, help needed:
I created a [Pull Request](https://github.com/IceWhaleTech/CasaOS-AppStore/pull/374) to add this implementation of Unifi Network Application to the official AppStore. If you can, consider testing it and sharing your experience there.
