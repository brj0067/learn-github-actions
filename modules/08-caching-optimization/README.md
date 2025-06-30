# Module 8: Workflow Caching & Dependency Optimization in GitHub Actions

Speed matters in CI/CD. In this module, you’ll learn to cache dependencies and build folders using GitHub's built-in caching support — making your workflows faster and more efficient.

---

## ✅ What You'll Learn

- How GitHub Actions caching works  
- How to cache `node_modules`, `pip`, or build folders  
- How to use `actions/cache@v4` correctly  
- How to restore and save caches  
- How to avoid common cache key mistakes

---

## 🔧 Use Cases

| Platform      | Cache Target           |
|---------------|------------------------|
| Node.js       | `node_modules/`        |
| Python        | `~/.cache/pip`         |
| Java          | `~/.m2/repository`     |
| Docker        | Docker build layers    |
| React/Next.js | `.next/`, `dist/`, `build/` |

---

## 1️⃣ Node.js Caching Example

```yaml
name: Node.js CI with Caching

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Cache node_modules
        uses: actions/cache@v4
        with:
          path: node_modules
          key: node-modules-${{ hashFiles('package-lock.json') }}
          restore-keys: node-modules-

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

