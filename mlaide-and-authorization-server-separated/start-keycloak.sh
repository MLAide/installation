set -a # automatically export all variables
source .env
set +a

docker-compose -f keycloak.docker-compose.yml up