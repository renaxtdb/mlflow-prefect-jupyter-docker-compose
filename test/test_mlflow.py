import mlflow
import pytest

def test_conect_mlflow():
    mlflow.set_tracking_uri("http://mlflow:5050")
    mlflow.set_experiment("test")
