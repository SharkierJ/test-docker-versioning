set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sharkierj
# image name
IMAGE=version-test
docker build -t $USERNAME/$IMAGE:latest .
