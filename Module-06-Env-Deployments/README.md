# Module 6: Staging to Production Deployment with Approvals in GitHub Actions

Now that you have monitoring, security, and reusable workflows in place, it’s time to ship safely.  
In this module, you'll set up **multi-environment deployments** — typically used to separate **staging** and **production** — with **manual approval gates**.

---

## ✅ What You'll Learn

- How to define GitHub deployment environments  
- How to control deployments to staging and production  
- How to enforce manual approval before production  
- How to assign secrets per environment  
- How to connect jobs using `needs` and `environment`

---

## 1️⃣ Create Environments in GitHub
nano Module-06-Env-Deployments/README.md

Go to your repository:

# Module 6: Staging to Production Deployment with Approvals in GitHub Actions

Now that you have monitoring, security, and reusable workflows in place, it’s time to ship safely. In this module, you'll set up multi-environment deployments — typically used to separate **staging** and **production** deployments — with manual approval gates.

---

## ✅ What You'll Learn

- How to define GitHub deployment environments
- How to control deployments to staging and production
- How to enforce manual approval before production
- How to assign secrets per environment
- How to connect jobs with `needs` and `environment`

---

## 1️⃣ Create Environments in GitHub

Go to your repo settings:

**Settings → Environments → New environment**

Create these two environments:
- `staging`
- `production`

For `production`, enable:
- ✅ Required reviewers (add your GitHub username)
- ✅ Optional wait timer
- ✅ Add secrets like `PROD_DB_URL`, `PROD_API_KEY`

---

## 2️⃣ Example Deployment Workflow

📄 File: `.github/workflows/deploy.yml`

```yaml
name: Deploy to Staging and Production

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Build
        run: echo "✅ Build completed"

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: staging
    steps:
      - name: Deploy to Staging
        run: echo "🚀 Deploying to staging..."

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment:
      name: production
    steps:
      - name: Deploy to Production
        run: echo "🚀 Deploying to production..."


Create two environments:
- `staging`
- `production`

In the `production` environment:
- ✅ Enable **required reviewers** (add yourself)
- ✅ Optionally add a **wait timer**
- ✅ Add deployment **secrets** (like `PROD_API_KEY`)

---

## 2️⃣ Example Deployment Workflow

📄 File path: `.github/workflows/deploy.yml`

```yaml
name: Deploy to Staging and Production

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Build
        run: echo "✅ Build completed"

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: staging
    steps:
      - name: Deploy to Staging
        run: echo "🚀 Deploying to staging..."

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment:
      name: production
    steps:
      - name: Deploy to Production
        run: echo "🚀 Deploying to production..."

Create two environments:
- `staging`
- `production`

In the `production` environment:
- ✅ Enable **required reviewers** (add yourself)
- ✅ Optionally add a **wait timer**
- ✅ Add deployment **secrets** (like `PROD_API_KEY`)

---

## 2️⃣ Example Deployment Workflow

📄 File path: `.github/workflows/deploy.yml`

```yaml
name: Deploy to Staging and Production

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Build
        run: echo "✅ Build completed"

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: staging
    steps:
      - name: Deploy to Staging
        run: echo "🚀 Deploying to staging..."

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment:
      name: production
    steps:
      - name: Deploy to Production
        run: echo "🚀 Deploying to production..."

Create two environments:
- `staging`
- `production`

In the `production` environment:
- ✅ Enable **required reviewers** (add yourself)
- ✅ Optionally add a **wait timer**
- ✅ Add deployment **secrets** (like `PROD_API_KEY`)

---

## 2️⃣ Example Deployment Workflow

📄 File path: `.github/workflows/deploy.yml`

```yaml
name: Deploy to Staging and Production

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Build
        run: echo "✅ Build completed"

  deploy-staging:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: staging
    steps:
      - name: Deploy to Staging
        run: echo "🚀 Deploying to staging..."

  deploy-production:
    needs: deploy-staging
    runs-on: ubuntu-latest
    environment:
      name: production
    steps:
      - name: Deploy to Production
        run: echo "🚀 Deploying to production..."

