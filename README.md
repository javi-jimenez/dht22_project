# DHT22 Docker Swarm Project

This project reads temperature and humidity data from a DHT22 sensor on a Raspberry Pi, exposing the readings through a FastAPI interface.

## Features
- Real-time streaming of sensor data (JSON & Plain Text)
- Dockerized with support for Docker Swarm
- Health check endpoint

## Setup & Deployment

Run the setup script:

```bash
bash setup_project.sh
```

Deploy with Docker Swarm manually:

```bash
./swarm-deploy.sh
```

## License
This project is licensed under the MIT License.

