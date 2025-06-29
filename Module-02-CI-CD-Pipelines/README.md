Module 2: Building CI/CD Pipelines with GitHub Actions
📘 Goal: Learn how to automate your software lifecycle: test code on every commit, build artifacts, and deploy to production — using modern GitHub Actions workflows.

✅ What You’ll Learn in Module 2
Topic	Description
🧠 CI/CD basics	What’s the difference? Why automate?
⚙️ Multi-step workflows	Chain jobs across build, test, deploy
🔁 Job dependencies	Use outputs & needs: keyword
🧪 Testing frameworks	Run tests on push/PR
📦 Build artifacts	Upload build outputs
🌐 Deployment targets	Deploy to GitHub Pages / cloud
🚀 Best practices	Secrets, environments, caching, speed
💥 Error handling	Fail-fast, retries, notifications

🧩 What is CI/CD?
Term	Meaning
CI (Continuous Integration)	Automatically run builds/tests on new code
CD (Continuous Delivery/Deployment)	Automatically release tested code to users
GitHub Actions makes both possible in one YAML-based platform.	

📁 Folder Structure
bash
Copy
Edit
Module-02-CI-CD-Pipelines/
├── README.md
└── .github/
    └── workflows/
        ├── ci-node.yml
        ├── ci-python.yml
        ├── deploy-gh-pages.yml
🧠 1. Concept: CI Workflow Structure
Here’s a simple CI pipeline example for Node.js

yaml
Copy
Edit
# .github/workflows/ci-node.yml
name: CI - Node.js App

on:
  push:
    branches: [main]
  pull_request:

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Install dependencies
        run: npm ci

      - name: Run tests
        run: npm test
✅ Outcome: Tests will run every time code is pushed or PR is opened.

🧪 2. Practice: Run Python CI
Create a new workflow for Python learners:

yaml
Copy
Edit
# .github/workflows/ci-python.yml
name: CI - Python App

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [3.10, 3.11]
    steps:
      - uses: actions/checkout@v4

      - name: Setup Python ${{ matrix.python-version }}
        uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.python-version }}

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Run tests
        run: pytest
🏗️ 3. Practice: Build and Upload Artifacts
yaml
Copy
Edit
- name: Archive production files
  run: zip -r build.zip dist/

- name: Upload artifact
  uses: actions/upload-artifact@v4
  with:
    name: build
    path: build.zip
🎯 Use this to keep production builds from each run.

🌍 4. Practice: Deploy to GitHub Pages
yaml
Copy
Edit
# .github/workflows/deploy-gh-pages.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v3

      - name: Upload Pages
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./public

      - name: Deploy
        uses: actions/deploy-pages@v2
🧠 This uses GitHub’s new built-in Pages Deployment system.

🔐 5. Best Practices (2025 Expert-Level)
Practice	Why
✅ checkout@v4	Always use latest action versions
✅ Pin action versions	Prevent unexpected breaking changes
🔒 Use secrets & environments	Never hardcode API keys
🚀 Use strategy.matrix	Test across versions
🕒 Use cache action	Speed up builds
📛 Use name: on steps	Improve log readability
💥 Set fail-fast: false on matrix if needed	Prevent 1 job from stopping others
📬 Add notifications (Slack, email)	Alert on failures
📦 Use upload-artifact + download-artifact	Share between jobs

💡 Bonus: Job Dependencies
yaml
Copy
Edit
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Build...
  test:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Test...
📚 needs: ensures one job finishes before the next begins.

🧪 Challenge: Full CI/CD
Build a static site (HTML/CSS/JS)

Test for broken links or syntax (e.g., htmlhint)

Deploy to GitHub Pages

Add badge to your README

Use on: pull_request for preview

✅ Your Action Plan
Task	Status
Clone/fork this module ✅	Module-02-CI-CD-Pipelines
Practice Node.js CI ✅	
Practice Python CI ✅	
Try uploading an artifact ✅	
Deploy to GitHub Pages ✅	
Add badge + link to deployment ✅	

🏁 What’s Next?
You’re now ready for:

Module 3: Security Best Practices – Secrets, Fork Attacks, Token Scoping, PR Hardening
