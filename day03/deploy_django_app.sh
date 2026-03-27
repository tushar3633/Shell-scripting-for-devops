#!/bin/bash

<< task
deploy a django app and handle code for errors
task

clone_code() {
	echo "Cloning the django app...."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements() {
	echo "Installing Dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restart() {
	sudo chown $USER var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

deploy() {
	sudo docker build -t notes-app .
	sudo docker run -d -p 8000:8000 notes-app:latest
}

echo "Deploying *********************"

if ! clone_code; then
	echo "Code directory already exists"
	cd django-notes-app
fi
if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi
if ! required_restart; then
	echo "System fault identified"
	exit 1
fi

deploy

echo "Deployment done *********************"
