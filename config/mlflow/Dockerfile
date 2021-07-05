ARG PYTHON_VERSION
ARG DEBIAN_VERSION
ARG TAG=${PYTHON_VERSION}-${DEBIAN_VERSION}
FROM python:${TAG}

LABEL maintainer="renaxtdb1@gmail.com"
LABEL version="1.0"
LABEL description="Run mlflow image"

RUN mkdir -p /mlflow/mlruns

WORKDIR /mlflow

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN echo "export LC_ALL=$LC_ALL" >> /etc/profile.d/locale.sh
RUN echo "export LANG=$LANG" >> /etc/profile.d/locale.sh

# RUN pip install -U pip && \
#     pip install \
#     psycopg2==2.8.6 \
#     mlflow==1.17.0 \
#     sqlalchemy==1.4.17 \
#     boto3==1.17.86

WORKDIR /tmp/
COPY config/mlflow/pyproject.toml config/mlflow/poetry.lock* ./
RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install

EXPOSE 5000
