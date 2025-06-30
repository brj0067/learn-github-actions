Module 4: Reusable Workflows & Custom Actions
🎯 Goal: Learn how to write reusable workflows and create your own custom Actions (JavaScript, Docker, or composite) to standardize and scale automation across multiple repositories.

🧩 Why Reusable & Custom Actions Matter
Without Reuse	With Reuse
❌ Copy-paste across repos	✅ Centralized logic
❌ Manual updates everywhere	✅ Change once, apply everywhere
❌ Risk of drift & duplication	✅ Consistent CI/CD patterns

✅ What You'll Learn
✅ How to create reusable workflows

✅ How to call them with workflow_call

✅ How to pass inputs/outputs

✅ How to write your own composite action

✅ When to use JavaScript vs Docker Actions

📁 Folder Setup
bash
Copy
Edit
mkdir Module-04-Reusable-Actions
mkdir -p Module-04-Reusable-Actions/.github/workflows
📝 Create README.md
bash
Copy
Edit
nano Module-04-Reusable-Actions/README.md
Paste the full content below, save with Ctrl + O, Enter, then Ctrl + X.

markdown
Copy
Edit
# 🔁 Module 4: Reusable Workflows & Custom Actions

> Build reusable, shareable, and scalable CI/CD automation with GitHub Actions.

---

## 🔁 Reusable Workflow with `workflow_call`

✅ Create a workflow other repos or folders can call:

📄 `.github/workflows/lint-reusable.yml`

```yaml
name: Lint Reusable Workflow

on:
  workflow_call:
    inputs:
      folder:
        required: true
        type: string

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Linter
        run: echo "Linting folder ${{ inputs.folder }}"
📞 Caller Workflow Example
📄 .github/workflows/use-lint.yml

yaml
Copy
Edit
name: Use Lint Workflow

on: [push]

jobs:
  call-linter:
    uses: ./.github/workflows/lint-reusable.yml
    with:
      folder: src/
🛠 Composite Actions
Use composite actions to combine multiple shell steps into a reusable action.

📄 my-action/action.yml

yaml
Copy
Edit
name: Hello Action
description: Echo and list files
runs:
  using: "composite"
  steps:
    - run: echo "Hello from reusable action!"
    - run: ls -la
Caller:

yaml
Copy
Edit
uses: ./my-action
📌 Note: Composite actions can only use run, not uses: inside themselves.

⚙️ JavaScript Actions
For logic-based tasks (e.g., GitHub API, tokens, dynamic branching)

📄 index.js

js
Copy
Edit
const core = require('@actions/core')
core.setOutput('greeting', 'Hello from JavaScript Action!')
📄 action.yml

yaml
Copy
Edit
name: JS Action
description: Sends greeting
runs:
  using: node16
  main: index.js
🐳 Docker Actions
For isolated environments or custom binaries.

yaml
Copy
Edit
runs:
  using: docker
  image: Dockerfile
Inside Dockerfile, define your OS, tools, etc.

✅ Best Practices
Practice	Why
✅ Use workflow_call	Enables reuse across repos
✅ Use inputs + outputs	Parametrize workflows
✅ Store actions in their own repo (optionally)	Better modularity
✅ Pin action versions	Prevents unintentional changes
✅ Document everything	Make reusable logic clear

🔬 Lab: Create and Reuse
Write a reusable workflow that checks:

YAML validity

JSON format

Call it from a push workflow

Package a composite action that:

Logs user

Checks for a file

Echoes a custom message

yaml
Copy
Edit

---

## 📄 Create Example Workflow Files

---

### 🧱 1. Reusable Workflow

```bash
nano Module-04-Reusable-Actions/.github/workflows/lint-reusable.yml
Paste:

yaml
Copy
Edit
name: Lint Reusable Workflow

on:
  workflow_call:
    inputs:
      folder:
        required: true
        type: string

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Linting folder ${{ inputs.folder }}"
🧱 2. Caller Workflow
bash
Copy
Edit
nano Module-04-Reusable-Actions/.github/workflows/use-lint.yml
Paste:

yaml
Copy
Edit
name: Use Lint Workflow

on: [push]

jobs:
  call-linter:
    uses: ./.github/workflows/lint-reusable.yml
    with:
      folder: src/
✅ Final Step: Commit & Push
bash
Copy
Edit
git add .
git commit -m "Module 4: Reusable Workflows & Custom Actions"
git push origin main
