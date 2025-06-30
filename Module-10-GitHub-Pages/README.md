# Module 10: Deploying to GitHub Pages with GitHub Actions

GitHub Pages lets you host static websites directly from your repository. In this module, you’ll learn how to deploy static sites using GitHub Actions automatically.

---

## ✅ What You'll Learn

- How to deploy to GitHub Pages via Actions  
- How to set up `gh-pages` or `docs/` deployment  
- How to use `peaceiris/actions-gh-pages`  
- How to deploy React, Vite, SvelteKit, or HTML  
- How to deploy only on `main` branch

---

## 1️⃣ Example: Deploy `build/` Folder (React, Vite)

```yaml
# .github/workflows/deploy.yml

name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install dependencies
        run: npm ci

      - name: Build project
        run: npm run build

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build


