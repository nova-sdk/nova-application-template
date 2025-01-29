FROM --platform=amd64 regproxy.ornl.gov/hub_proxy/python:3.10-slim

ENV POETRY_CACHE_DIR=/poetry/.cache
ENV POETRY_CONFIG_DIR=/poetry/.config
ENV POETRY_HOME=/poetry

RUN apt-get update && apt-get install -y git
RUN pip install poetry copier

RUN git config --global user.email "test"
RUN git config --global user.name "test"

COPY . /template
RUN copier copy -d "project_name=Test Project" -l --vcs-ref=HEAD template src
RUN copier copy --data-file /template/dockerfiles/trame-answers.yml --vcs-ref=HEAD template src_trame

WORKDIR /src_trame
RUN poetry install

WORKDIR /src

RUN poetry install
RUN poetry build --format=wheel

RUN chmod og+rwX /poetry
RUN chmod og+rwX /src
RUN chmod og+rwX /src_trame