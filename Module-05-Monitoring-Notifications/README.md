nano Module-05-Monitoring-Notifications/README.md
# Module 5: Monitoring, Notifications & Diagnostics in GitHub Actions

As your CI/CD pipelines grow more complex, visibility becomes essential. This module introduces techniques to monitor workflows, summarize results, and notify your team when something goes wrong.

You'll learn how to make your workflows easier to debug, more informative, and responsive to failure — all critical in real-world DevOps environments.

---

## ✅ What You’ll Learn

- How to organize and annotate workflow logs
- How to add job summary reports (Markdown) in the UI
- How to send alerts via Slack, email, or GitHub Issues
- How to run follow-up diagnostics using `workflow_run`

---

## 1️⃣ Group and Annotate Logs

Group logs to make builds readable. Add warnings and errors with file/line references.

```yaml
- name: Grouped Logs
  run: |
    echo "::group::Install"
    npm ci
    echo "::endgroup::"

- name: Annotate
  run: |
    echo "::notice::Build started"
    echo "::warning file=src/app.js,line=12::Deprecated method"
    echo "::error file=src/app.js,line=20::Unexpected token"

$GITHUB_STEP_SUMMARY

- name: Job Summary
  run: |
    echo "## ✅ Test Report" >> $GITHUB_STEP_SUMMARY
    echo "- All tests passed" >> $GITHUB_STEP_SUMMARY

