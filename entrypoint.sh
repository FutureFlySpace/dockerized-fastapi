##### FASTAPI ENTRYPOINT #####
# Dockerize your FastAPI app
# 2023-10-20 - FutureFlySpace
##############################

##### VARS #####
port=${FASTAPI_PORT}
dir=${FASTAPI_DIR}
extra_deps=${FASTAPI_DEPS_FILE}


##### INSTALL EXTRA DEPS #####
if [ ! -z ./$extra_deps ]; then
    pip install --no-cache-dir --upgrade -r $extra_deps
fi


##### START APP #####
uvicorn app.main:${dir} --proxy-headers --host 0.0.0.0 --port $port