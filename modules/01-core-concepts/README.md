# 🧠 Module 01 – Core Concepts

Learn the basics of GitHub Actions:
- Workflows, jobs, steps
- `on:` triggers
- `runs-on` runners
- `env` and `matrix` strategy

---

## 📂 Structure

- `exercises/` – Practice YAMLs
- `solutions/` – Reference implementations

---

## ✅ What You'll Build

- Hello World CI workflow
- Matrix strategy with Node.js versions
- Use of environment variables
Module 1: Core Concepts & Quickstart with GitHub Actions
👨‍🏫 Goal: Understand what GitHub Actions is, how it works, and build your first CI workflow to automate a simple process on code push.

📌 What is GitHub Actions?
GitHub Actions is an automation platform built into GitHub. It lets you create workflows that respond to events in your repository (like pushes, pull requests, issue comments, etc.).

Think of it like this:

GitHub Events trigger...

Workflows which are made of...

Jobs that run on virtual machines (runners) and contain...

Steps like running scripts, checking out code, or installing dependencies.

🔧 Why Use GitHub Actions?
Feature	Benefit
Native to GitHub	No external CI/CD tool needed
Fast & scalable	GitHub-hosted runners support Windows, Linux, and macOS
Free tier	2,000+ monthly free minutes
Marketplace	10,000+ prebuilt actions to use
Secure	Supports secrets, token scoping, and permission controls

🗂️ Core Concepts
Term	Meaning
Workflow	A .yml file that defines what happens on certain events
Job	A collection of steps run on the same runner
Step	A single action (e.g., run a shell command or use a prebuilt Action)
Runner	The VM where the job executes (Linux/Windows/macOS)
Trigger/Event	What starts the workflow: push, pull_request, schedule, etc.
Action	A reusable block of logic defined by GitHub or the community
Secret	Encrypted environment variables (like API keys)

🚀 Your First GitHub Actions Workflow
🛠️ Step-by-step Exercise
Create a new public GitHub repo (e.g. github-actions-learners).

Inside the repo, create the following file:

bash
Copy
Edit
.github/workflows/hello-world.yml
Paste this workflow:

yaml
Copy
Edit
name: Hello World

on:
  push:
    branches: [ main ]

jobs:
  say-hello:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Print Hello Message
        run: echo "👋 Hello from GitHub Actions!"
Commit the file and push. Go to Actions tab on GitHub and watch it run.

🔍 What You Just Did
Triggered the workflow on push to the main branch.

Ran a job named say-hello on an Ubuntu runner.

Printed a greeting message.

📘 Mini-Challenge: Modify and Test
🔁 Try modifying this step:

yaml
Copy
Edit
- name: Print author info
  run: |
    echo "User: ${{ github.actor }}"
    echo "Commit Message: ${{ github.event.head_commit.message }}"
🧠 This uses GitHub Contexts, a way to access metadata like actor, branch, event type.

🧪 Lab Exercise: “Welcome Bot”
Create a workflow that:

Runs on every pull request

Prints the contributor's name

Says “Thanks for contributing!”

yaml
Copy
Edit
name: PR Welcome Bot

on:
  pull_request:
    types: [opened]

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Welcome message
        run: echo "Thanks @${{ github.actor }} for your contribution!"
➡️ Create a PR and see the bot thank you in the logs.

🛡️ Beginner Best Practices
🔒 Use actions/checkout@v4 (latest and secure)

🧪 Always test workflows in a test repo before applying to production

📎 Name jobs/steps clearly for visibility in the Actions tab

🛠 Use ubuntu-latest unless a specific OS is needed

✅ Pin actions to versions (like @v4) for stability

🎓 Quiz: What Did You Learn?
What file extension do GitHub Actions workflows use?

What is the difference between a job and a step?

How can you access metadata about the repo and commit in your workflow?

What does uses: actions/checkout@v4 do?

(Answers at the bottom of your repo README 😉)

🧭 What’s Next?
You’re now ready to move into:
Module 2: CI/CD Pipelines – Building, Testing, and Deploying Code Automatically

We’ll cover:

Running tests automatically

Deploying apps to GitHub Pages or cloud

Using artifacts, caches, and environment variables


