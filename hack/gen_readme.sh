#!/bin/sh
# Run this hack from root.

GIT_REPO="duyetdev/spark-history-server-docker"
DOCKERHUB_IMAGE_NAME="duyetdev/spark-history-server"
GITHUB_DOCKER_IMAGE_NAME="spark-history-server"
PLATFORMS="aws gcp azure"
SPARK_VERSION="v3.0.0 v2.4.0 latest"
OUTFILE="README.md"

cat <<'EOF' >$OUTFILE
# Docker Image for Spark History Server

Docker image for Spark history Server on Kubernetes

# Supported tags

EOF

for PLATFORM in $PLATFORMS; do
    printf ' - ' >> $OUTFILE

    for VERSION in $SPARK_VERSION; do
        printf "\`$PLATFORM-$VERSION\` " >> $OUTFILE
    done

    echo >> $OUTFILE
    echo >> $OUTFILE
done


cat <<EOF >>$OUTFILE
# Pull image

## Github Docker

Package: https://github.com/duyetdev/spark-history-server-docker/packages/238883

\`\`\`
docker pull docker.pkg.github.com/${GIT_REPO}/$GITHUB_DOCKER_IMAGE_NAME:<tag>
\`\`\`

## Docker Hub

Docker Hub: https://hub.docker.com/r/duyetdev/spark-history-server

\`\`\`
docker pull $DOCKERHUB_IMAGE_NAME:<tag>
\`\`\`
EOF

cat $OUTFILE
