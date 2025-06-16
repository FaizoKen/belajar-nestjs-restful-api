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
