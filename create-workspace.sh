#!/usr/bin/env bash

if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Missing argument/s"
    echo $"Usage: $0 <environment> <working directory>"
    exit 1
fi

environment="$1"
working_directory="$PWD/$2"
mkdir -p "$working_directory"

shift 2
docker_opts="$@"

echo "Attempting to work from '$working_directory'..."

case "$environment" in
    golang)
        docker run --rm -it ${docker_opts} -v "$working_directory":/go/src/myapp -w /go/src/myapp golang:1.8 bash
        ;;

    node)
        docker run --rm -it ${docker_opts} -v "$working_directory":/usr/src/myapp -w /usr/src/myapp node:9.3.0 bash
        ;;

    react)
        if [ ! -z "$(ls -A "$working_directory")" ]; then
            echo "The working directory must be empty"
            exit 1
        fi
        docker run --rm -it ${docker_opts} -v "$working_directory":/usr/src/myapp -w /usr/src/myapp codebykumbi/create-react-app:latest bash
        ;;

    *)
        echo $"The environment provided is not supported. Feel free to add to the list :)"
        exit 1
esac
