# Flutter App Template

A highly scalable, modular, and maintainable Flutter app template that integrates best practices such as:
- Feature-first clean architecture
- Riverpod for state management
- go_router for routing
- Localization (i18n) support
- Theme switching (light/dark/system)
- Firebase authentication support
- In-app and local notification system
- Modular settings and layout

## 📁 Project Structure

```
lib/
├── app/                     # App entry (MyApp, theme switching, locale handling)
├── config/                  # Global configuration (e.g. supported locales)
├── core/                    # Global services, constants, and providers
│   ├── constants/           # Styling constants (colors, spacing, radii, durations, fonts)
│   ├── providers/           # Global providers (e.g. theme, locale, notification toggle)
│   └── services/            # Platform services (e.g. local notification)
├── features/                # Feature-first structure (modular features)
│   └── <feature_name>/
│       ├── presentation/    # UI: screens and widgets
│       ├── application/     # Business logic: use cases and controllers
│       ├── domain/          # Models and abstract interfaces
│       └── infrastructure/  # Concrete implementations (Firebase, APIs)
├── l10n/                    # Localization files (.arb)
├── router/                  # Routing configuration using go_router
├── theme/                   # Theme definitions (light/dark)
├── bootstrap.dart            # App initialization (service setup, provider overrides)
└── main.dart                # App entry point
```

## 🚀 Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Configure Firebase (Optional)
If using Firebase:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
This generates `lib/firebase_options.dart`. Update your Firebase project settings as needed.

### 3. Run the App
```bash
flutter run
```

## 🚀 How to Rename the App

You can easily rename this template to your own project name using the script below.

### Step 1: Make the setup script executable

```bash
chmod +x scripts/setup.sh
```

### Step 2: Run the script with your app name and package name
```bash
bash scripts/setup.sh "My Cool App" "com.mycompany.coolapp"
```

This will:
- Rename the app's display name on Android & iOS
- Change the Android/iOS package ID (e.g., `com.example.app`)

### Manual Cleanup

After renaming:
- Restart your IDE
- Run `flutter clean && flutter pub get`

## 🌐 Localization
- Edit translations in `lib/l10n/*.arb`
- Run:
```bash
flutter gen-l10n
```
- Use in code:
```dart
AppLocalizations.of(context)!.yourKey
```

## 🎨 Theme Switching
The app supports light, dark, and system theme modes. Controlled via Riverpod:
```dart
ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);
```

## 🔔 Notifications
- Local notifications with `flutter_local_notifications`
- Toggle in Settings screen using Riverpod

## 🧭 Routing
Using `go_router` with optional layout shell:
```dart
context.go('/settings');
```
Wrapped screens use a global layout (`AppShell`) for bottom navigation.

## ✅ Features Checklist
- [x] Localization & internationalization
- [x] Light/Dark/System theme switcher
- [x] Firebase Auth: login/signup/logout
- [x] Riverpod state management
- [x] Modular feature-first architecture
- [x] Local + Firebase notifications
- [x] Bottom navigation + layout shell

## 🧪 Testing (Coming Soon)
- Feature-wise test structure under `/test`
- Unit, widget, and integration test samples

## 📦 Recommended Add-ons
- Drift or Hive for local DB
- Secure storage for tokens
- REST API + Dio + Repository pattern
- App-wide error handling and loading states

## 🛠 Contribution Guide
This template is built to be forked and extended. To add a new feature:
1. Create a folder under `features/<new_feature>`
2. Add `presentation`, `application`, `domain`, `infrastructure` layers
3. Register routes in `router/app_router.dart`

---

Built with ❤️ by applying scalable Flutter architecture principles.

