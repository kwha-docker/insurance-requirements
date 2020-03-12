#!/bin/bash
docker rm ins_develop
MYPORT=$(grep "c.NotebookApp.port" ~/.jupyter/jupyter_notebook_config.py | tail -c 5)

if [ "$1" == "--start-jupyter" ]; then
    docker-compose run -p $MYPORT:8888 --name ins_develop insurance_env \
        jupyter notebook --ip 0.0.0.0 --port $MYPORT --no-browser --allow-root --NotebookApp.token='kwh'
elif ["$1" == ""]; then
    docker-compose run -p $MYPORT:8888 --name ins_develop insurance_env bash
else
    echo "Invalid arg. Please indicate --start-jupyter if you want to start Jupyter."\
        "Don't add an argument if you want to exec into bash on docker startup."
fi

