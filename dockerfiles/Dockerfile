FROM --platform=amd64 python:3.10-slim AS source

RUN pip install poetry
COPY . /src
WORKDIR /src
RUN poetry install
RUN poetry build --format=wheel
