import psycopg2

from settings import settings
from transform import read_csv


def connect_to_db(dsn):
    with psycopg2.connect(dsn=dsn) as conn:
        return conn


def generate_insert_sql(table, headers, datatuples):
    def cast(val, type):
        if type == str:
            return f"'{val}'" if val else 'null'
        elif type == int:
            return val or 'null'

    if not headers or not datatuples:
        return
    joined_headers = ', '.join(headers).lower()
    joined_data = ',\n'.join(datatuples)
    sql = (
        'INSERT INTO {0} ({1})\n'
        'VALUES\n{2}\nRETURNING {3};'
    )
    generated = sql.format(
        table, joined_headers, joined_data, headers[0].lower())
    return generated


def generate_value_tuple(data, mapper):
    if not data or not mapper:
        return

    def cast(val, type):
        if type == str:
            return f"'{val}'" if val else 'null'
        elif type == int:
            return val or 'null'

    joined_data = ', '.join(
        list(map(lambda i: cast(i[0], i[1]), zip(data, mapper)))
    )
    return f'({joined_data})'


def generate_data(rows, mapper):
    return map(
        lambda row: generate_value_tuple(row, mapper), rows
    )


def save_sql(path, content):
    with open(path, 'w+') as f:
        f.write(content)


def insert_data(conn):
    emp = list(read_csv('tables/emp.csv'))
    emp_headers, emp_data = emp[0], emp[1:]
    emp_mapper = (int, str, str, int, str, int, int, int)

    dept = list(read_csv('tables/dept.csv'))
    dept_headers, dept_data = dept[0], dept[1:]
    dept_mapper = (int, str, str)

    cur = conn.cursor()
    datatuples = generate_data(emp_data, emp_mapper)
    sql = generate_insert_sql('emp', emp_headers, datatuples)
    save_sql('commands/generated_insert_emp.sql', sql)
    cur.execute(sql)

    cur = conn.cursor()
    datatuples = generate_data(dept_data, dept_mapper)
    sql = generate_insert_sql('dept', dept_headers, datatuples)
    save_sql('commands/generated_insert_dept.sql', sql)
    cur.execute(sql)

    for i in ['1', '10', '100', '500']:
        pivot = list(read_csv(f'tables/T{i}.csv'))
        pivot_headers = pivot[0]
        pivot_data = pivot[1:]
        pivot_mapper = (int,)
        datatuples = generate_data(pivot_data, pivot_mapper)
        sql = generate_insert_sql(f't{i}', pivot_headers, datatuples)
        cur.execute(sql)

    cur.close()
    conn.commit()


if __name__ == '__main__':
    conn = connect_to_db(settings.POSTGRES_URI)
    insert_data(conn)
