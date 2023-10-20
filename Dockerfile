##### FASTAPI DOCKERFILE #####
# Dockerize your FastAPI app
# 2023-10-20 - FutureFlySpace
##############################


ARG PYTHON_IMAGE
ARG VERSION

FROM python:$PYTHON_IMAGE

LABEL author="FutureFlySpace"
LABEL version=$VERSION
LABEL description="FastAPI Docker container image \
Look here for more information: https://github.com/FutureFlySpace/dockerized-fastapi"

ENV FASTAPI_PORT="8000"
ENV FASTAPI_DIR="app"
ENV FASTAPI_DEPS_FILE="requirments.txt"

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin --home /code fastapi

COPY --chown=fastapi --chmod=744 ./entrypoint.sh /

USER fastapi
WORKDIR /code

RUN pip install --no-cache-dir --upgrade fastapi pydantic uvicorn &&\

EXPOSE 8000

CMD [ "bash", "-c", "/entrypoint.sh" ]