#!/usr/bin/env bash
set -euo pipefail

DEST_DIR="${1:-metube-offline}"
mkdir -p "$DEST_DIR"

echo "== build.func =="
curl -L "https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/build.func" \
  -o "$DEST_DIR/build.func"

echo "== Deno install.sh =="
curl -L "https://deno.land/install.sh" \
  -o "$DEST_DIR/deno-install.sh"

echo "== Архив MeTube (tarball latest) =="
# важно: тот же источник, что и в fetch_and_deploy_gh_release для tarball
curl -L "https://api.github.com/repos/alexta69/metube/tarball" \
  -o "$DEST_DIR/metube-latest.tar.gz"

echo "Все файлы скачаны в: $DEST_DIR"
