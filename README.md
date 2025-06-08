## Install MySQL database

## Create .env file and place your MySQL database connection url

```
DATABASE_URL="mysql://root:root@localhost:3306/belajar_nestjs_restful_api_prod"
```

## Migrate

```bash
$ npm run migrate
```

## Installation

```bash
# all
$ npm install
# only prod
$ npm install --only=prod
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests (disabled)
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

clean export prod code

nest build

./dist >
prisma
package.json
package-lock.json

dont forget to put mysql database on .env

```bash
npm run start:super-prod
```
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

# Fix prisma permissions
RUN chmod +x ./node_modules/.bin/prisma

# Expose NestJS default port
EXPOSE 3000

# Run the app
CMD ["npm", "run", "start:super-prod"]
```


```yaml
services:
  testapp:
    image: testapp
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

docker network create app-network


example database

```yaml
version: '3.8'

services:
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
    networks:
      - mynetwork

networks:
  mynetwork:
    driver: bridge
```
docker network create testapp
docker run --name mysql-testapp --network testapp -d mysql/mysql-server

docker logs mysql-testapp 2>&1 | grep GENERATED

docker run -it ubuntu bash

```yaml
version: '3.8'

services:
  db:
    image: ubuntu
    environment:
      DATABASE_URL="mysql://root:root@localhost:3306/belajar_nestjs_restful_api"
    ports:
      - "3000:3000"
    networks:
      - testapp

```yaml