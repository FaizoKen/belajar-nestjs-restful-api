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
npm install --only=prod
npx prisma migrate deploy
node main.js
```

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

```yaml
version: '3.8'

services:
  db:
    image: prodimage
    environment:
      DATABASE_URL="mysql://root:root@localhost:3306/belajar_nestjs_restful_api"
    ports:
      - "3000:3000"
    networks:
      - mynetwork

networks:
  mynetwork:
    driver: bridge
```yaml