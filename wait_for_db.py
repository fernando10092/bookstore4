import time
import psycopg2
from psycopg2 import OperationalError

db_settings = {
    "dbname": "bookstore_dev_db",
    "user": "bookstore_dev",
    "password": "bookstore_dev",
    "host": "db",
    "port": 5432,
}

def wait_for_db():
    while True:
        try:
            conn = psycopg2.connect(**db_settings)
            conn.close()
            print("Database is ready!")
            break
        except OperationalError:
            print("Database is not ready yet. Retrying in 1 second...")
            time.sleep(1)

if __name__ == "__main__":
    wait_for_db()
