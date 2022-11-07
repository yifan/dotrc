function docker_publish {
    NAME=$1
    TAG=$2

    docker tag $NAME meganews.azurecr.io/meganews/$NAME:$TAG
    docker push meganews.azurecr.io/meganews/$NAME:$TAG
}

function docker_overwrite {
    NAME=$1
    TAG=$2
    docker rmi --force $(docker images  | grep $NAME | grep $TAG | awk '{print $3}')
    docker tag $NAME meganews.azurecr.io/meganews/$NAME:$TAG
    docker push meganews.azurecr.io/meganews/$NAME:$TAG
}

