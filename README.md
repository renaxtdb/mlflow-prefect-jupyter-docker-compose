# mlflow-prefect-jupyter-docker-compose

Deploy mlflow and Prefect with docker-compose.  
You can use Prefect and MLflow by entering the Jupyter container and working with it.

![Scheme図](doc/images/Scheme.png)

## 1. Create .env file

In `docker-compose.yaml`, some parameters is loaded from `.env` file.  
Set following parameters in `.env`.  
You can easily configure it by using `.env_template`.

```
USER_NAME = <user name>
COMPOSE_PROJECT_NAME=<project name>

# Mount volume path
MOUNT_PATH = ./

# jupyter port setting
JUPYTER_PORT_NO = 8819

# docker image version
PYTHON_VERSION = 3.7
DEBIAN_VERSION = slim-buster

# hasura config
PREFECT_SERVER__HASURA__ADMIN_SECRET=<password>

# Minio config
MINIO_ACCESS_KEY=<user nmae>
MINIO_SECRET_KEY=<password>
MINIO_MOUNT_PATH=./logs/artifacts
MINIO_PORT=9000

#container resources
CONTAINER_LIMIT_MEMORY = 8g
CONTAINER_USE_CPU = 2

# postgresql config
POSTGRES_USER = <usuer name>
POSTGRES_PASSWORD = <password>


##### Automatically generated environment parameters
MINIO_URL = http://minio:${MINIO_PORT}

# prefect config
PREFECT_SERVER_TAG=latest
# Using exact version because of https://github.com/PrefectHQ/ui/issues/798
PREFECT_UI_TAG=2021-02-23

# hasura config
PREFECT_SERVER__TELEMETRY__ENABLED=false
PREFECT_SERVER_DB_CMD="prefect-server database upgrade -y"

#postgresql
POSTGRES_POERT=5432
POSTGRES_DB_NAME=mlflow_db
PREFECT_DB_NAME=prefect_db

DB_URL = postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${POSTGRES_DB_NAME}
DB_CONNECTION_URL = postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:5432/${PREFECT_DB_NAME}

ARTIFACT_PATH = s3://default/
```

## 2. Build and deploy
Build Mlflow server and Prefect server, and then deploy applications.

```sh
$ make build
$ make up-background
```

## 3. Access Jupyter and Mlflow UI and Prefect UI

Jupyter Lab  
http://localhost:8819  
Mlflow  
http://localhost:5050  
Prefect UI  
http://localhost:8080  
Minio  
http://localhost:9000
### Option: If you want prefect server

## 4. Run `start.sh` in Jupyter container

After attatch Jupyter container

```sh
$ cd /home/work
$ sh start.sh
```


### Infrastructure model

![Infrastructure model](.infragenie/infrastructure_model.png)