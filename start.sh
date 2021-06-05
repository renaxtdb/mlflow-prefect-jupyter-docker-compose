#!/bin/sh

cp jupyter/config.toml ~/.prefect/config.toml
prefect backend server
prefect server create-tenant --name default --slug default
