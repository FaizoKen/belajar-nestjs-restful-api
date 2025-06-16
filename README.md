# 🛠️ Prerequisites (Dev)

- Install **MySQL** and ensure it's running.

## 📄 Setup `.env` File

Create a `.env` file in the root directory and add your MySQL database connection URL (example):

```env
DATABASE_URL="mysql://root:root@localhost:3306/belajar_nestjs_restful_api_prod"
```

> 💡 Replace the credentials and database name with your actual configuration.

## 🔄 Database Migration

Run the following command to apply existing migrations:

```bash
npx prisma migrate dev
```

## 📦 Install Dependencies

```bash
npm install
```

## 🚀 Running the Application

```bash
# Start in normal mode (no auto restart)
npm run start

# Start in watch mode (auto-restart on file changes)
npm run start:dev
```

## 🧪 Run App Tests

```bash
# Execute unit tests
npm run test
```

## 🏗️ Test The Prod Build

```bash
# build
npm run build

# Test the build
npm run start:prod
```

# Start on Docker (Prod)

## 🚀 Commands (Linux/macOS)

### 🔨 Build Application and Docker Image

```bash
npm run build:docker
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

### 🗃️ Stop MySQL Container

```bash
docker compose -f db-compose.yml down
```

---

### ▶️ Stop the Application

```bash
docker compose -f app-compose.yml down
```

---

### ✅ Notes

- Make sure Docker and Docker Compose are installed.
- If you're running this for the first time, ensure `app-network` doesn't already exist to avoid conflict.
- You can combine both services into a single `docker-compose.yml` if desired.
