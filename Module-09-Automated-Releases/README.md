# Module 9: Automating Releases with GitHub Actions

This module teaches you how to automatically create GitHub releases when new tags are pushed. Perfect for production deployments, libraries, and open-source projects.

---

## ✅ What You'll Learn

- How to automatically publish GitHub Releases  
- How to generate changelogs from commits  
- How to tag and version releases  
- How to upload release assets (e.g. ZIPs, binaries)  
- How to trigger releases on tag push

---

## 1️⃣ GitHub Release Workflow

```yaml
# .github/workflows/release.yml

name: Publish GitHub Release

on:
  push:
    tags:
      - 'v*.*.*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Create GitHub Release
        uses: softprops/action-gh-release@v2
        with:
          generate_release_notes: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

