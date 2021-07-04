from prefect import task, Flow
import random
from prefect.storage import S3
import os

@task
def random_error():
    if random.random() < 0.5:
        raise RuntimeError()

storage = S3(bucket="prefect", client_options=dict(endpoint_url=os.getenv("MLFLOW_S3_ENDPOINT_URL")))

with Flow('random-errors', storage=storage) as flow:
    for _ in range(8):
        random_error()


flow.register(project_name="My Project",labels=["dev"])
