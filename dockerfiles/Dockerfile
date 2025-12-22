FROM --platform=amd64 python:3.10-slim

RUN apt-get update && apt-get install -y curl git
RUN pip install copier

RUN curl -fsSL https://pixi.sh/install.sh | sh
ENV PATH="/root/.pixi/bin:${PATH}"

RUN git config --global user.email "test"
RUN git config --global user.name "test"

COPY . /template
RUN copier copy --data-file /template/dockerfiles/.cli-copier-answers.yml --vcs-ref=HEAD template src_cli
RUN copier copy --data-file /template/dockerfiles/.library-copier-answers.yml --vcs-ref=HEAD template src_library
RUN copier copy --data-file /template/dockerfiles/.minimal-copier-answers.yml --vcs-ref=HEAD template src_minimal
RUN copier copy --data-file /template/dockerfiles/.ndip-tool-copier-answers.yml --vcs-ref=HEAD template src_ndip_tool
RUN copier copy --data-file /template/dockerfiles/.nova-application-copier-answers.yml --vcs-ref=HEAD template src_nova_application
RUN copier copy --data-file /template/dockerfiles/.tutorial-copier-answers.yml --vcs-ref=HEAD template src_tutorial


WORKDIR /src_cli
RUN pixi install

WORKDIR /src_library
RUN pixi install

WORKDIR /src_ndip_tool
RUN pixi install

WORKDIR /src_nova_application
RUN pixi install

WORKDIR /src_tutorial
RUN pixi install
RUN pixi run hatch build

RUN mkdir -p /.cache
RUN chmod -R og+rwX /.cache /src_cli /src_library /src_minimal /src_ndip_tool /src_nova_application /src_tutorial