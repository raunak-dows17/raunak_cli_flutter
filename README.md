# 🛠️ Raunak CLI Dart – Flutter Clean Architecture Generator

A powerful CLI tool to scaffold production-ready **Clean Architecture** Flutter projects using layered architecture and opinionated best practices.

---

## 🚀 Features

- `dart run raw_cli_dart.dart init <project_name>`:
    - Creates a Flutter project with `flutter create`
    - Generates a scalable Clean Architecture folder structure
    - Prompts for:
        - Primary theme color
        - Network client: `dio`, `http`, or none
    - Adds and installs essential dependencies:
        - `dio`, `google_fonts`, `flutter_dotenv`, `flutter_secure_storage`, `go_router`

- Generates boilerplate for:
    - `main.dart` entry
    - `AppTheme` for light/dark mode
    - `API Client` (if network is enabled)
    - Routing (`app_routes.dart`, `navigate.dart`)
    - Local storage wrapper (`local_storage.dart`)
    - Environment config (`env.config.dart`)
    - Constants and API endpoints
    - Token management

---

## 🧪 Usage

To initialize a project:

```bash
dart run bin/raw_cli_dart.dart init my_app
During setup, it will ask:
🎨 Primary Color Hex
(Default: 0xFF2196F3)

🌐 Network Client
dio / http / none

📦 Default Dependencies
These dependencies are automatically added:

dependencies:
  dio: any
  google_fonts: any
  flutter_dotenv: any
  flutter_secure_storage: any
  go_router: any
Additional user-defined dependencies will also be appended if provided.

🧩 Coming Soon
generate:feature <name> – Create a new feature module with all 3 layers.

generate:model <name> – Scaffold domain entity and model files.

init --with-auth – Add secure login/signup module.

init --with-supabase – Backend-as-a-Service bootstrapping.

👨‍💻 Author
Made with ❤️ by Raunak Pandey

Feel free to star 🌟 and contribute on GitHub

📄 License
MIT – Free to use, extend, and contribute.

---

Let me know if you'd like:

- A **LinkedIn post** to promote this
- A **sample project** to showcase generated output
- Help publishing this as a Dart package (`pub.dev`)