#########################
# environment variables #
#########################
echo "Setting environment variables"

# hosts
export HOST_NAME=example.com
export KEYCLOAK_HOST_NAME=$HOST_NAME

# host ports
export UI_PORT=8880
export SERVER_PORT=8881
export MONGO_PORT=8882
export MINIO_PORT=8883
export KEYCLOAK_PORT=8884

# application
export APP_NAME=mlaide
export DATA_PATH="./data"
export NETWORK_NAME=mlaide-network

# mlaide webserver
export MLAIDE_SERVER_LOG_LEVEL=INFO
export MLAIDE_SERVER_AUTH_JWK_SET_URI=http://$KEYCLOAK_HOST_NAME:$KEYCLOAK_PORT/auth/realms/MLAide/protocol/openid-connect/certs
export MLAIDE_SERVER_AUTH_USER_INFO_ENDPOINT=http://$KEYCLOAK_HOST_NAME:$KEYCLOAK_PORT/auth/realms/MLAide/protocol/openid-connect/userinfo
export MLAIDE_SERVER_AUTH_USER_INFO_NICKNAME_PROPERTY=preferred_username
export MLAIDE_SERVER_AUTH_AUDIENCE=http://$KEYCLOAK_HOST_NAME:$KEYCLOAK_PORT/auth/realms/MLAide

# mlaide ui
export MLAIDE_UI_AUTH_CLIENT_ID=mlaide.demo
export MLAIDE_UI_AUTH_ISSUER="http://$KEYCLOAK_HOST_NAME:$KEYCLOAK_PORT/auth/realms/MLAide" # set this value to the same as $KEYCLOAK_HOST_NAME
export MLAIDE_UI_AUTH_SCOPES="openid profile email"

# keycloak
export KEYCLOAK_CONFIGURATION_TEMPLATE=./config/keycloak/demo-config.template.json
export KEYCLOAK_CONFIGURATION=./config/keycloak/demo-config.json
export KEYCLOAK_ADMIN_USER=admin
export KEYCLOAK_ADMIN_PASSWORD=admin

# mongodb
export MONGO_AUTO_INDEX_CREATION=true
export MONGO_ROOT_USERNAME=root
export MONGO_ROOT_PASSWORD=root
export MONGO_DB=mlaide
export MONGO_DB_USERNAME=user1
export MONGO_DB_PASSWORD=user1
export MONGO_INITDB_SCRIPTS_HOST_PATH="./config/mongodb"
 
# S3 / min.io
export MINIO_ACCESS_KEY=minio
export MINIO_SECRET_KEY=minio123
export S3_ENDPOINT=http://minio-nginx:9000
export S3_REGION=us-east-1

##########################
# keycloak configuration #
##########################
# echo "Configuring Keycloak"

# UI_URI=http://$HOST_NAME:$UI_PORT
# cat $KEYCLOAK_CONFIGURATION_TEMPLATE | jq --arg UI_URI "$UI_URI" '.clients[4].redirectUris += [$UI_URI]' > $KEYCLOAK_CONFIGURATION

###########################
# start docker containers #
###########################
echo "Start ML Aide"
docker-compose up