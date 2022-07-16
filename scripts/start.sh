#!/usr/bin/env bash

# start.sh
# script to run server application

ABSPATH=$(reallink -f $0)
ABSDIR=$(dirname $ABSPATH)
source ${ABSDIR}/profile.sh

REPOSITORY=/home/ec2-user/app

cp $REPOSITORY/deploy/*.jar $REPOSITORY/.file

JAR_NAME=$(ls -tr $REPOSITORY/*.jar | tail -n 1)


chmod +x $JAR_NAME

IDLE_PROFILE=$(find_idle_profile)

echo "> deploy application... JAR name: '$JAR_JAR_NAME', profile: '$IDLE_PROFILE'"

nohup java -jar \
    -Dspring.profiles.active=$IDLE_PROFILE \
    $JAR_NAME > $REPOSITORY/nohub.out 2>$1 &
