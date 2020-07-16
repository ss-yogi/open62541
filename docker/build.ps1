$Version="1.1.1"

docker build --tag open62541-build:${Version} -f Dockerfile ..
docker create open62541-build:${Version}
$ContainerName=(docker container ls -l --format "{{.Names}}")

docker cp ${ContainerName}:/opt/open62541/build/open62541.tar.gz ./open62541-${version}-alpine.tar.gz
docker cp ${ContainerName}:/opt/open62541/pki/created/server_cert.der .
docker cp ${ContainerName}:/opt/open62541/pki/created/server_key.der .

docker container rm $ContainerName

docker build --tag open62541-run:${Version} -f Dockerfile.run ..

