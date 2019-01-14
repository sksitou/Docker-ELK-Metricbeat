VER=1.23
DIR="$PWD"
if [[ $(docker-compose --version | cut -d',' -f1 | cut -d' ' -f3) > $VER ]]; then
    docker-compose --version
else
    sudo yum install epel-release
    sudo yum install -y python-pip
    sudo pip install docker-compose
    sudo yum upgrade python*
    docker-compose --version
    if [[ $(docker-compose --version | cut -d',' -f1 | cut -d' ' -f3) > $VER ]]; then
        docker-compose --version
    else
        echo docker-compose install failed
        echo required version: $ver
        exit -1
    fi
fi

