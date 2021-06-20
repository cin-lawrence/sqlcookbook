import psycopg2

from settings import settings
from transform import read_csv


def connect_to_db(dsn):
    with psycopg2.connect(dsn=dsn) as conn:
        return conn


def generate_insert_sql(table, headers, data, mapper):
    def cast(val, type):
        if type == str:
            return f"'{val}'" if val else 'null'
        elif type == int:
            return val or 'null'

    if not headers or not data:
        return
    joined_headers = ', '.join(headers)
    joined_data = ', '.join(
        list(map(lambda i: cast(i[0], i[1]), zip(data, mapper)))
    )
    sql = (
        "INSERT INTO {0} ({1})"
        "VALUES ({2}) RETURNING {3};"
    )
    generated = sql.format(table, joined_headers, joined_data, headers[0])
    return generated


def insert_data(conn):
    emp = list(read_csv('tables/emp.csv'))
    emp_headers = emp[0]
    emp_data = emp[1:]
    emp_mapper = (int, str, str, int, str, int, int, int)
    emp_res = []

    dept = list(read_csv('tables/dept.csv'))
    dept_headers = dept[0]
    dept_data = dept[1:]
    dept_mapper = (int, str, str)
    dept_res = []

    cur = conn.cursor()
    for row in emp_data:
        sql = generate_insert_sql('emp', emp_headers, row, emp_mapper)
        res = cur.execute(sql)
        emp_res.append(res)

    for row in dept_data:
        sql = generate_insert_sql('dept', dept_headers, row, dept_mapper)
        res = cur.execute(sql)
        dept_res.append(res)

    cur.close()
    conn.commit()

    return emp_res, dept_res


if __name__ == '__main__':
    conn = connect_to_db(settings.POSTGRES_URI)
    insert_data(conn)
