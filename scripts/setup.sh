#!/bin/bash

# Usage: bash scripts/setup.sh "App Name" "com.yourcompany.appname"

APP_NAME=$1
PACKAGE_NAME=$2

if [ -z "$APP_NAME" ] || [ -z "$PACKAGE_NAME" ]; then
  echo "❗ Usage: bash scripts/setup.sh \"App Name\" \"com.yourcompany.appname\""
  exit 1
fi

echo "📦 Running flutter pub get..."
flutter pub get

echo "🏷 Renaming app to \"$APP_NAME\"..."
dart run rename_app:main all --appname "$APP_NAME"

echo "🔁 Changing package name to \"$PACKAGE_NAME\"..."
dart run change_app_package_name:main "$PACKAGE_NAME"

echo "✅ Done! You may need to restart your IDE and clean the build:"
echo "   flutter clean && flutter pub get"
