#!/bin/sh

prefect backend server
prefect server create-tenant -n default
prefect create project "My Project"
