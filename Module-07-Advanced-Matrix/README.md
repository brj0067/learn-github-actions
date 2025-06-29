Module 7: Advanced Matrix Builds and Parallel Testing in GitHub Actions
In modern CI pipelines, it's critical to test your code across multiple environments — different Node.js versions, OS platforms, or runtime combinations. GitHub Actions makes this easy using matrix builds, which automatically run jobs in parallel.

✅ What You'll Learn
How matrix builds scale tests across environments

How to define multiple Node.js versions in one job

How to test on different operating systems

How to exclude or customize matrix combinations

How to name matrix jobs for readability

1️⃣ Matrix Strategy for Node.js Versions
Use strategy.matrix to test the same workflow logic across Node.js versions:

yaml
Copy
Edit
name: Test on Node Versions

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14, 16, 18]
    name: Node ${{ matrix.node-version }} Test
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
      - run: npm ci
      - run: npm test
✅ This creates three parallel jobs: one for Node.js 14, 16, and 18.

2️⃣ Cross-Platform Testing with OS + Node Matrix
You can also run tests on multiple operating systems:

yaml
Copy
Edit
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest, macos-latest]
    node: [16, 18]
🔁 This will test on 6 combinations:

OS	Node
Ubuntu	16
Ubuntu	18
Windows	16
Windows	18
macOS	16
macOS	18

Example:
yaml
Copy
Edit
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: [16, 18]
    name: ${{ matrix.os }} / Node.js ${{ matrix.node }}
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm ci
      - run: npm test
3️⃣ Exclude Certain Matrix Combinations
Sometimes a certain OS/version combo isn’t supported. You can exclude them:

yaml
Copy
Edit
strategy:
  matrix:
    os: [ubuntu-latest, macos-latest]
    node: [14, 16]
    exclude:
      - os: macos-latest
        node: 14
This will skip that pair (macOS + Node 14) but test all others.

🧪 Practice Task
Use a sample Node project

Create a matrix workflow:

Node versions: 16 and 18

OS: Ubuntu and macOS

Introduce a test failure in one combo (simulate edge cases)

Observe:

Jobs run in parallel

Each job shows in Actions UI with its matrix label

💡 Expert Tips
Feature	Use
strategy.matrix	Run one job across multiple configs
name: with variables	Better job visibility (e.g., Node 18 / Ubuntu)
exclude:	Prevent known-bad configurations
fail-fast: false	Let all matrix jobs finish before failing the whole workflow

🧠 What You’ve Achieved
You now understand:

How to run CI pipelines across versions and platforms

How to improve confidence before release

How to structure tests the same way large-scale open-source and enterprise projects do

This sets you up for building even more scalable, reliable, and portable pipelines.# Module 7: Advanced Matrix Builds and Parallel Testing in GitHub Actions

When building software for multiple environments, you want to **test in parallel** across OSes, versions, and configurations. This module introduces **matrix builds**, allowing you to multiply test coverage without increasing complexity.

---

## ✅ What You'll Learn

- How to use `strategy.matrix` for parallel jobs
- How to test across multiple Node.js versions
- How to run on different OSes (Ubuntu, macOS, Windows)
- How to include/exclude matrix combinations
- How to name and track each test run

---

## 1️⃣ Example: Test Node.js App on Multiple Versions

```yaml
name: Test on Node Versions

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14, 16, 18]
    name: Node ${{ matrix.node-version }} Test
    steps:
      - uses: actions/checkout@v4
      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
      - run: npm ci
      - run: npm test

