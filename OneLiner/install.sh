#!/bin/bash
clear
echo -e "\e[0m\c"

echo '
-----------------------------------------------------------------
Welcome to the installation script for Unifi Network Application.
-----------------------------------------------------------------

This will deploy both the Unifi Network Application and MongoDB container, along with a bridge network to connect the two.

If you previously deployed containers unifi-db and unifi-network-application, they will be reinstalled.
'
read -p "Press enter to continue: " user_input
if [ "$user_input" = "" ]; then
    echo "Enter pressed. Let's GO!"
    echo ""
else
    echo "Exiting"
    exit 1
fi

dependencies=("docker")
for dependency in "${dependencies[@]}"; do
    if ! command -v "$dependency" &> /dev/null; then
        echo "Error: $dependency is not installed."
        exit 1
    fi
done

if ! docker info > /dev/null 2>&1; then
  echo "This script uses docker, and it isn't running - please start docker and try again!"
  exit 1
fi

docker compose &>/dev/null 

if [ $? -ne 0 ]; then
    echo "You need to install docker compose (v2) to continue"
    exit 1
fi

#ask for installation directory, default to home
read -p "Enter an absolute path to place the installation directory (or press Enter for the home folder): " user_input
path=${user_input:-$HOME}

if [ -d "$path/unifi" ]; then
    echo "Installation directory already exists. Grant sudo access and let the script handle it, or delete it manually and restart the script."
    sudo rm -rf "$path/unifi"
fi
echo ""

mkdir -p "$path/unifi"
mkdir -p "$path/unifi/unifi-network-application"
mkdir -p "$path/unifi/unifi-db"

#ask for database password, default to pass
read -p "Enter the password for the database (or press Enter for the default value: pass): " user_input
echo ""
password=${user_input:-"pass"}

#create a temporary folder to be used during installation process
tmp_dir="$HOME/unifi-install-tmp"
rm -rf "$tmp_dir"
mkdir -p "$tmp_dir"
cd "$tmp_dir"

#download the compose file
wget -q -O docker-compose.yml https://raw.githubusercontent.com/GiuseppeGalilei/Unifi-Network-Application/main/OneLiner/docker-compose.yml >/dev/null 2>&1

#generate env file and place it in the unifi-install-tmp folder
echo "INSTALL_FOLDER=$path" > .env
echo "DB_PASSWORD=$password" >> .env

#generate init-mongo.js file 
cat <<EOL > $path/unifi/init-mongo.js
db.getSiblingDB("unifi-db").createUser({user: "unifi", pwd: "$password", roles: [{role: "dbOwner", db: "unifi-db"}]});
db.getSiblingDB("unifi-db_stat").createUser({user: "unifi", pwd: "$password", roles: [{role: "dbOwner", db: "unifi-db_stat"}]});
EOL

#install
container_names=("unifi-db" "unifi-network-application")

# Check and remove containers and volumes
for container_name in "${container_names[@]}"; do
    if docker ps -a --format '{{.Names}}' | grep -q "^$container_name$"; then
        echo "Stopping and removing container $container_name..."
        docker stop "$container_name" >/dev/null 2>&1
        docker rm "$container_name" >/dev/null 2>&1

        # Remove associated volumes
        echo "Removing volumes for container $container_name..."
        docker volume rm "$(docker volume ls -qf "name=${container_name}_data")" >/dev/null 2>&1
    fi
done

docker compose up -d

# Check the exit code of the previous command
if [ $? -ne 0 ]; then
    echo "Error: "docker compose up" failed"
    exit 1
fi

echo "docker compose up completed successfully"

for container_name in "${container_names[@]}"; do
    while ! docker inspect -f '{{.State.Running}}' "$container_name" &>/dev/null; do
        echo "Waiting for containers to start..."
        sleep 1
    done
done

echo ""

rm -rf "$tmp_dir"

#ending message

echo '
Done!
The dashboard will be available soon on port 8443.

If you get error 404 do not worry, just wait a few more minutes for the dashboard to initialize.

IMPORTANT! After Install:
Because the network application runs inside Docker, by default it uses an IP address not accessible by other devices.
So, for it to adopt other devices, it is required to use port `8080` and change the inform IP address. To do so, go in settings and search for the `Inform Host` option, there select override and set the address to that of the host.
Often, it is also needed to SSH into the devices you want to adopt and manually set the inform IP address, the command needed for doing so is `set-inform http://HOST-ADDRESS:8080/inform`.

More information and instructions at https://github.com/GiuseppeGalilei/Unifi-Network-Application
------------------------------------------------------------------------------------

If you found it useful, consider giving a star to this project and supporting my work.
More of my projects at https://github.com/GiuseppeGalilei.

Thanks for using this and have a wonderful day!
'
