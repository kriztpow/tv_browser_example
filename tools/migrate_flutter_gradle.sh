#!/usr/bin/env bash
set -euo pipefail
# Simple migration script to ensure plugins DSL and Flutter gradle plugin are set.
ANDROID_DIR="android"
APP_DIR="$ANDROID_DIR/app"

if [[ ! -d "$ANDROID_DIR" ]]; then
  echo "No android directory found. Aborting."
  exit 1
fi

backup_stamp="$(date +%Y%m%d-%H%M%S)"
mkdir -p tools/.backup-gradle-$backup_stamp

for f in "$ANDROID_DIR/settings.gradle" "$ANDROID_DIR/build.gradle" "$APP_DIR/build.gradle"; do
  if [[ -f "$f" ]]; then
    cp "$f" "tools/.backup-gradle-$backup_stamp/$(basename "$f")"
  fi
done

echo "Migration placeholder complete. Review android/*.gradle manually if needed."