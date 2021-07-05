FROM prefecthq/prefect:0.14.21-python3.7

ENV PYTHONPATH "${PYTHONPATH}:/home/work/"

# install python module Production
WORKDIR /tmp/
COPY config/jupyter/pyproject.toml config/jupyter/poetry.lock* ./
RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-dev\
    && rm -rf ~/.cache
