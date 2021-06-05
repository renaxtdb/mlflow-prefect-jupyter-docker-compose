# mlflow-prefect-jupyter-docker-compose
Deploy mlflow with docker-compose

## 1. Create .env file
In `docker-composa.yaml`, some parameters is loaded from `.env` file.
Set following parameters in `.env`.

```
# docker-compose config
USER_NAME = <user name>
COMPOSE_PROJECT_NAME=mlflow_${USER_NAME}

# port setting
JUPYTER_PORT_NO = 8819

# docker image version
PYTHON_VERSION = 3.7
DEBIAN_VERSION = slim-buster

# postgresql config
HOST=mlflow.dev
POSTGRES_USER=demo-user
POSTGRES_PASSWORD=demo-password
POSTGRES_POERT=5432
POSTGRES_DB_NAME=mlflow-db
DB_URL = postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgresql:${POSTGRES_POERT}/${POSTGRES_DB_NAME}
ARTIFACT_PATH = <artifact_path>

#container resources
CONTAINER_LIMIT_MEMORY = 8g
CONTAINER_USE_CPU = 2
```

## 2. Build and deploy
Build mlflow Dockerfilw, and then deploy applications.

```sh
$ docker-compose build
$ docker-compose up -d
```

## 3. Access Jupyter and Mlflow UI

Jupyter Lab  
http://localhost:8819  
Mlflow  
http://localhost:5000  
Prefect UI  
http://localhost:8080  
Minio  
http://localhost:9000  




### Option: If you want prefect server
## 4. Run `start.sh` in Jupyter container

After attatch Jupyter container

```sh
$ cd /home/jovyan/work
$ sh start.sh
```

if you want prefect tutorial click [here](src/README.md).
