import dlt
from dlt.sources.filesystem import filesystem, read_csv


@dlt.resource(
    table_name="customers", write_disposition="replace", primary_key="customer_id"
)
def customers():
    file_path = "./data/raw/olist_customers_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(table_name="geolocations", write_disposition="replace")
def geolocation():
    file_path = "./data/raw/olist_geolocation_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(
    table_name="order_items",
    write_disposition="replace",
    primary_key=["order_id", "order_item_id"],
)
def order_items():
    file_path = "./data/raw/olist_order_items_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(
    table_name="order_payments",
    write_disposition="replace",
    primary_key=["order_id", "payment_sequential"],
)
def order_payments():
    file_path = "./data/raw/olist_order_payments_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(
    table_name="order_reviews",
    write_disposition="replace",
    primary_key=["review_id", "order_id"],
)
def order_reviews():
    file_path = "./data/raw/olist_order_reviews_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(table_name="orders", write_disposition="replace", primary_key="order_id")
def orders():
    file_path = "./data/raw/olist_orders_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(
    table_name="products", write_disposition="replace", primary_key="product_id"
)
def products():
    file_path = "./data/raw/olist_products_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.resource(
    table_name="sellers", write_disposition="replace", primary_key="seller_id"
)
def sellers():
    file_path = "./data/raw/olist_sellers_dataset.csv"
    yield from filesystem(bucket_url=file_path, file_glob="") | read_csv


@dlt.source
def olist_source():
    return [
        customers(),
        geolocation(),
        order_items(),
        order_payments(),
        order_reviews(),
        orders(),
        products(),
        sellers(),
    ]


def load() -> None:
    """Realiza a ingestão de dados no banco.
    """    
    pipeline = dlt.pipeline(
        pipeline_name="olist_pipeline", destination="postgres", dataset_name="raw"
    )

    load_info = pipeline.run(olist_source())
    return print(load_info)


if __name__ == "__main__":
    load()
