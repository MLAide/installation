# ML Aide Installation templates
This repostiory contains installation templates for [ML Aide](https://mlaide.com).

1. all-in-one
  This setup contains a Docker Compose based setup that includes the following components:
    - ML Aide UI
    - ML Aide Server
    - Keycloak Authorization Server
    - MongoDB
    - min.io (S3 storage)

2. mlaide-and-authorization-server-seperated
  This setup contains the same components as the previous one. The only difference is, that the Keycloak
  instance is started using a separate Docker Compose file. This comes handy if the Keycloak Authorization
  Server should run on a different machine.

# Run all-in-one setup
To run the all-in-one setup execute the following steps:
1. open & edit the `all-in-one/start.sh` file. Basically you just need to change the value of `HOST_NAME` to the value 
of your DNS record, that points to your target server.
2. open & edit the `all-in-one/config/keycloak/demo-config.json` file. Go to `clients[4].redirectUris` (approx in line 727) 
and replace the existing value with `http://<your-host-name>:8880/*` (use the same host name as in step 1).
3. copy & paste the whole directory `all-in-one` to your target server.
4. `cd` into the copied directory and run `./start.sh` (if you need to use sudo for docker command, than.
you need to run `sudo ./start.sh`)