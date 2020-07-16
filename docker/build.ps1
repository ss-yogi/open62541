$Version="1.1.1"

docker build --tag open62541-build:${Version} -f Dockerfile ..
docker create open62541-build:${Version}
$ContainerName=(docker container ls -l --format "{{.Names}}")

docker cp ${ContainerName}:/opt/open62541/build/open62541-${Version}.tar.gz .
docker cp ${ContainerName}:/opt/open62541/pki/created/server_cert.der .
docker cp ${ContainerName}:/opt/open62541/pki/created/server_key.der .

docker container rm $ContainerName

