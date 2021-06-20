import shutil
import csv
from io import StringIO
from typing import Generator, List


def save_csv(file_path: str, csv_object: StringIO):
    with open(file_path, 'w') as f:
        csv_object.seek(0)
        shutil.copyfileobj(csv_object, f)


def create_csv(
        headers: List[str],
        data: List[tuple],
        ):
    file_ = StringIO()
    writer = csv.writer(file_, quotechar='"', quoting=csv.QUOTE_ALL)
    rows = (headers, *data)
    for row in rows:
        writer.writerow(row)
    file_.seek(0)
    return file_


def read_csv(file_path: str) -> Generator:
    with open(file_path, 'r') as f:
        reader = csv.reader(f, quotechar='"', quoting=csv.QUOTE_ALL)
        for row in reader:
            yield row
