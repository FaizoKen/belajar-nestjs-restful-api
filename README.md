# Start on Docker (Prod)

### 🔨 Build Application Docker Image

```bash
npm run build:docker
```

### 🌏 Up Database and Application

```bash
docker compose up
```

---

# Start on Local (Dev)

### 📄 Setup `.env` File

Create a `.env` file in the root directory and add your MySQL database connection URL (example):

```env
DATABASE_URL="mysql://root:root@localhost:3306/belajar_nestjs_restful_api_prod"
```

> 💡 Replace the credentials and database name with your actual configuration and make sure **MySQL** is running.

### 🔄 Database Migration

Run the following command to apply existing migrations:

```bash
npx prisma migrate dev
```

### 📦 Install Dependencies

```bash
npm install
```

### 🚀 Running the Application

```bash
# Start in normal mode (no auto restart)
npm run start

# Start in watch mode (auto-restart on file changes)
npm run start:dev
```

### 🧪 Run App Tests

```bash
# Execute unit tests
npm run test
```

### 🏗️ Test The Prod Build

```bash
# build
npm run build

# Test the build
npm run start:prod
```
