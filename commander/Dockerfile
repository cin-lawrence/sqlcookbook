FROM python:3.7 as base

RUN pip install psycopg2 pydantic[dotenv]

RUN mkdir -p /app/commander
WORKDIR /app/commander
