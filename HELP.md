# Getting Started
Sample Spring boot application for demo-ing dockerization
### Commands
Commands
docker login
docker build -t mvishnumohan/spring-boot-api-test:1.0 .
docker image prune --filter label=stage=builder
docker images
docker compose up -d
docker compose down
docker push vmm/spring-boot-api-test:1.0
docker rmi vmm/spring-boot-api-test:1.0
