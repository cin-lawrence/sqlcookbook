import psycopg2
from settings import settings


def connect_to_db(dsn):
    with psycopg2.connect(dsn=dsn) as conn:
        return conn


def create_init_tables(conn):
    with open('commands/create_emp_table.sql') as f:
        emp_command = f.read()

    with open('commands/create_dept_table.sql') as f:
        dept_command = f.read()

    cur = conn.cursor()
    cur.execute(emp_command)
    cur.execute(dept_command)
    cur.close()
    conn.commit()


if __name__ == '__main__':
    conn = connect_to_db(settings.POSTGRES_URI)
    create_init_tables(conn)
