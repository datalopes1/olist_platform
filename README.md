
#### `.env`
```plaintext
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_pwd
POSTGRES_HOST=host.docker.internal
```


#### `.dlt`
```plaintext
[destination.postgres.credentials]
driver = "postgres"
host = "host.docker.internal"
port = 5433
database = "your_db"
username = "your_user"
password = "your_pwd"
```