# Create this file on new folder

## Dockerfile

```Dockerfile
FROM node

WORKDIR /app

RUN apt-get update && apt-get install -y unzip curl

RUN curl -L -o docker-prod.zip https://github.com/FaizoKen/belajar-nestjs-restful-api/raw/refs/heads/main/docker-prod.zip \
    && unzip docker-prod.zip \
    && rm docker-prod.zip

EXPOSE 3000

CMD ["npm", "run", "start:docker-prod"]
```


## db-compose.yml

```yaml
services:
  db:
    image: mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
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

# Use this command (Linux)

## Build Dockerfile
```bash
docker build --no-cache -t app .
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

## Monitor App
```bash
docker compose -f app-compose.yml logs -f
```