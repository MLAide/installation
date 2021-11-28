set -a # automatically export all variables
source .env
set +a

docker-compose -f mlaide.docker-compose.yml up