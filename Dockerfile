FROM python:3.12

COPY pyproject.toml .
COPY poetry.lock .

RUN pip install poetry --no-cache-dir --upgrade
RUN poetry install --no-root

WORKDIR /app

COPY . .

ENV PYTHONPATH = /app/src

EXPOSE 8000

RUN ["poetry", "run", "python", "src/main.py"]

