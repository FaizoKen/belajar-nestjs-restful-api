# Create this file on new folder

## Dockerfile

```Dockerfile
# Use Node.js official image
FROM node:20

# Create app directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y unzip curl

# Download and unzip the project
RUN curl -L -o super-prod.zip https://github.com/FaizoKen/belajar-nestjs-restful-api-1/raw/refs/heads/main/super-prod.zip \
    && unzip super-prod.zip \
    && rm super-prod.zip

# Move into the unzipped directory if needed
# Uncomment and adjust this line based on actual structure
# WORKDIR /app/super-prod

# Expose NestJS default port
EXPOSE 3000

# Run the app
CMD ["npm", "run", "start:super-prod"]
```


## app-compose.yml

```yml
services:
  app:
    image: app
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=mysql://root:root@db:3306/belajar_nestjs_restful_api
    networks:
      - app-network

networks:
  app-network:
    external: true
```


## db-compose.yml

```yaml
services:
  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: belajar_nestjs_restful_api
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - app-network

volumes:
  db_data:

networks:
  app-network:
    external: true

```


# Use this command (Linux)

## Build Dockerfile
```bash
docker build -t app .
```

## Create app network

```bash
docker network create app-network
```

## Start MySQL database
```bash
docker compose -f db-compose.yml up -d
```

## Start App
```bash
docker compose -f app-compose.yml up -d
```