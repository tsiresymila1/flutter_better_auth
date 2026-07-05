#!/usr/bin/env bash
# Tag the current commit with v<pubspec-version> and push it (triggers publish.yml).
# ponytail: no arg parsing — version comes from pubspec.yaml, the single source of truth.
set -euo pipefail
cd "$(dirname "$0")/.."

version="$(grep -E '^version:' pubspec.yaml | head -n1 | sed -E 's/^version:[[:space:]]*//')"
tag="v${version}"

[ -n "$(git status --porcelain)" ] && { echo "Working tree dirty — commit first."; exit 1; }
git rev-parse "$tag" >/dev/null 2>&1 && { echo "$tag already exists."; exit 1; }

echo "Tagging $tag …"
git tag "$tag"
git push origin "$tag"
echo "Pushed $tag — publish workflow will run."
