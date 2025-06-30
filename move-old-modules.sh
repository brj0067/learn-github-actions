#!/bin/bash

echo "🚀 Moving old modules into 'modules/' directory..."

# Ensure 'modules' directory exists
mkdir -p modules

# Move and rename old module folders
mv Module-04-Reusable-Actions modules/04-reusable-actions
mv Module-05-Monitoring-Notifications modules/05-monitoring-notifications
mv Module-06-Env-Deployments modules/06-env-deployments
mv Module-07-Advanced-Matrix modules/07-advanced-matrix
mv Module-08-Caching-Optimization modules/08-caching-optimization
mv Module-09-Automated-Releases modules/09-automated-releases
mv Module-10-GitHub-Pages modules/10-github-pages

echo "✅ All modules successfully moved!"

