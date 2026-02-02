## Overview
This repository demonstrates running Nginx inside a Docker container
to serve a static content.

The project focuses on:
  -  Dockerfile basics
  -  Nginx configuration
  -  Port mapping with Docker


## Requirements
  -  Git
  -  Docker
  -  Docker Compose


## Clone the repository 
```bash
git clone https://github.com/EmirTurkbey/container-labs.git
cd nginx/basic
```

## Repository Structure
Docker -> Nginx image definition  
docker-compose.yml -> Container orchestration  
nginx.conf -> Nginx configuration  
html/ -> Static web content  


## Build and Run
Build and run the container:
```bash
docker compose up --build
```

Run in detached mode:
```bash
docker compose up -d
```

## Access the Application
Type in browser:
http://localhost:8080


## Stop
```bash
docker compose down
```






