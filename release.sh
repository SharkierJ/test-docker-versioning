set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sharkierj
# image name
IMAGE=version-test
# ensure we're up to date
git pull
# bump version
docker run --rm -v "$PWD":/app sharkierj/version-test patch
version=`cat VERSION`
echo "version: $version"
head=`git rev-parse --short=7 HEAD`
echo "head: $head"
# run build
./build.sh
# tag it
git add -A
git tag -a "$version" $head -m "version $version"
git push origin -f --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
