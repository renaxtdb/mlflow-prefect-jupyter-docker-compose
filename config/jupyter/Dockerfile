ARG PYTHON_VERSION
ARG DEBIAN_VERSION
ARG JUPYTER_PORT_NO

ARG TAG=${PYTHON_VERSION}-${DEBIAN_VERSION}
FROM python:${TAG} AS python-base

LABEL maintainer="renxtdb1@gmail.com"
LABEL version="1.1"
LABEL description="jupyterを実行可能なdocker image。付属のdocerk-composeと合わせることを推奨。"

RUN mkdir -p /usr/share/man/man1
# install etc & setting
RUN apt-get update -y \
    && apt-get install --no-install-recommends -y \
    curl \
    graphviz \
    git\
# install nodejs
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install --no-install-recommends -y nodejs \
    && rm -rf ~/.cache \
    && apt-get clean all

# install python module Production
WORKDIR /tmp/
COPY config/jupyter/pyproject.toml config/jupyter/poetry.lock* ./
RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install \
    && rm -rf ~/.cache \
# install jupyterlab extentions
    && jupyter serverextension enable --py jupyterlab_code_formatter\
    && jupyter labextension install \
        @ryantam626/jupyterlab_code_formatter \
        @jupyterlab/toc
COPY config/jupyter/settings.jupyterlab-settings /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings
ENV PYTHONPATH /home/work

WORKDIR /home/work
