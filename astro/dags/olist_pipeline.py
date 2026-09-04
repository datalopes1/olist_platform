from datetime import datetime, timedelta
from pathlib import Path

from airflow.sdk import dag, task

from src.extract import extract
from src.load import load

DBT_PROJECT_DIR = "/usr/local/airflow/dbt"

default_args = {
    "owner": "data-eng",
    "depends_on_past": False,
    "email_on_failure": False,
    "retries": 3,
    "retry_delay": timedelta(minutes=5),
}

@dag(
    dag_id="olist_dw_pipeline",
    default_args=default_args,
    schedule='0 5 * * *',
    start_date=datetime(2026, 9, 1),
    catchup=False
)
def olist_dw_pipeline():

    @task(task_id="extract_data")
    def task_extract():
        extract()

    @task(task_id="load_data")
    def task_load():
        load()

    @task.bash(task_id="transform_data")
    def task_transform():
        return f"cd {DBT_PROJECT_DIR} && dbt build -t prod"

    e = task_extract()
    l = task_load()
    t = task_transform()

    e >> l >> t

olist_dw_pipeline()