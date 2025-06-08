# 🐳 Docker Deployment Guide – NestJS RESTful API

A step-by-step guide to building, packaging, and deploying your NestJS app using Docker.

---

## 📦 Step 1: Build & Package the Application

### ✅ 1. Build the NestJS Project

```bash
nest build
```

---

### 📁 2. Prepare Files for Deployment

Bundle the following files and folders into a zip file named **`docker-prod.zip`**:

```
/
├── dist
├── prisma
├── package.json
└── package-lock.json
```

> 📌 This ensures the container includes only what's needed for production.

---

### 🔁 3. Upload to GitHub

Push `docker-prod.zip` to your GitHub repository. Example:

```
https://github.com/FaizoKen/belajar-nestjs-restful-api/raw/refs/heads/main/docker-prod.zip
```

---

## 🛠️ Step 2: Create Docker Configuration Files

In a separate folder, add the following files:

---

### 📄 `Dockerfile`

```Dockerfile
# Use the official Node.js image
FROM node

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y unzip curl

# Download and extract app code
RUN curl -L -o docker-prod.zip https://github.com/FaizoKen/belajar-nestjs-restful-api/raw/refs/heads/main/docker-prod.zip \
    && unzip docker-prod.zip \
    && rm docker-prod.zip

# Expose app port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start:docker-prod"]
```

---

### 📄 `db-compose.yml`

```yaml
services:
  db:
    image: mysql:latest
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

---

### 📄 `app-compose.yml`

```yaml
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

---

## 🚀 Step 3: Docker Commands (Linux/macOS)

### 🔨 Build the Docker Image

```bash
docker build --no-cache -t app .
```

---

### 🌐 Create Docker Network

```bash
docker network create app-network
```

---

### 🗃️ Start MySQL Container

```bash
docker compose -f db-compose.yml up -d
```

---

### ▶️ Start the Application

```bash
docker compose -f app-compose.yml up -d
```

---

### 📄 View Application Logs

```bash
docker compose -f app-compose.yml logs -f
```
---
### ✅ Notes

* Make sure Docker and Docker Compose are installed.
* If you're running this for the first time, ensure `app-network` doesn't already exist to avoid conflict.
* You can combine both services into a single `docker-compose.yml` if desired.