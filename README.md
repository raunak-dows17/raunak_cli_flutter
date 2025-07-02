
# 🛠️ Raunak CLI Dart – Flutter Clean Architecture Generator

A powerful CLI tool to scaffold production-ready **Clean Architecture** Flutter projects using layered architecture and opinionated best practices.

---

## 🚀 Features

### 🔹 `dart pub global activate raunak_cli`
- Activate the CLI globally from [pub.dev](https://pub.dev/packages/raunak_cli)

### 🔹 `raunak-cli init <project_name>`
- Creates a Flutter project using `flutter create`
- Generates a scalable Clean Architecture folder structure
- Prompts you for:
  - 🎨 Primary theme color (default: `0xFF2196F3`)
  - 🌐 Network client: `dio`, `http`, or `none`
- Adds and installs essential dependencies:
  - `dio`, `google_fonts`, `flutter_dotenv`, `flutter_secure_storage`, `go_router`

---

## 📁 Generated Structure

```

lib/
├── config/
│   ├── theme/
│   │   └── app\_theme.dart
│   ├── routes/
│   │   ├── app\_routes.dart
│   │   └── navigate.dart
│   ├── env/
│   │   └── env.config.dart
│   └── storage/
│       └── local_storage.dart
├── core/
│   ├── entities/
│   ├── models/
│   ├── usecases/
│   ├── datasources/
│   │   ├── local/
│   │   │   └── user\_token.dart
│   │   └── remote/
│   │       └── api\_client.dart
│   ├── utils/constants/
│   │   └── api\_endpoints.dart
│   └── error/
└── features/
main.dart
.env

````

---

## 🧪 Usage

### ✅ Step-by-step

```bash
# Activate globally
dart pub global activate raunak_cli

# Create a new clean Flutter project
raunak-cli init my_app
````

### During Setup:

* 🎨 Enter Primary Color Hex (e.g. `0xFF4CAF50`)
* 🌐 Choose Network Client: `dio`, `http`, or `none`

### 📦 Default Dependencies Added

```yaml
dependencies:
  dio: any
  google_fonts: any
  flutter_dotenv: any
  flutter_secure_storage: any
  go_router: any
```

You can also input additional dependencies during setup.

---

## 🧩 Coming Soon

* `generate:feature <name>` – Create a feature module (Domain, Data, and Presentation layers)
* `generate:model <name>` – Scaffold domain entities and data models
* `init --with-auth` – Bootstrap login/signup and auth flow

---

## 👨‍💻 Author

Made with ❤️ by **Raunak Pandey**
GitHub: [@raunak-dows17](https://github.com/raunak-dows17)

If you like this tool, don't forget to ⭐️ the repo and share it with your Flutter friends!

---

