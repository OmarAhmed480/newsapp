# 📰 News App

**Developed by Eng. Omar Ahmed Ali**

A modern and responsive Flutter News Application that allows users to browse, search, and read news articles through a clean and user-friendly interface.

The project focuses on **Clean Architecture, Repository Pattern, SOLID Principles, Dependency Injection, API Integration, and State Management**, following a structured and maintainable approach to Flutter development.

---

## ✨ Features

* 🚀 Splash Screen
* 🏠 Browse the latest news
* 📰 Explore news by category
* 🔎 Search news by keywords
* 📖 View detailed news articles
* 🌐 Open full articles using WebView
* 🌍 English and Arabic localization
* ↔️ RTL layout support
* 🌓 Light and Dark Mode
* 💾 Persist language and theme preferences
* 🖼️ Cached network images
* ⏱️ Relative publication time
* 📴 Connectivity monitoring
* 🗄️ Local data storage using Hive
* 🛡️ API and network error handling

## 📰 News Categories

* General
* Business
* Sports
* Technology
* Entertainment
* Health
* Science

---

## 🏗️ Architecture & Design Patterns

The application follows **Clean Architecture** principles to separate responsibilities and improve maintainability, scalability, and testability.

### Repository Pattern

* Separates data access from business logic.
* Organizes communication with remote and local data sources.
* Makes data management easier to maintain and extend.

### BLoC / Cubit

Used to manage application states, including:

* News and category states
* Search states
* Loading, success, and error states

### Provider

Used to manage application-wide preferences, including:

* Language selection
* Light and Dark Mode

### Dependency Injection

Implemented using:

* `get_it` — Service locator for managing dependencies.
* `injectable` — Simplifies dependency registration and configuration.

### Local Data Storage

* `hive_ce` — Local database functionality.
* `hive_ce_flutter` — Hive integration with Flutter.
* `shared_preferences` — Persistent storage for lightweight settings.

---

## 🌐 API Integration & Networking

The application uses **Dio** for API communication and networking.

* Fetch news articles and categories.
* Search for news using keywords.
* Handle API responses and network errors.
* Monitor connectivity using `connectivity_plus`.
* Log requests and responses using `pretty_dio_logger`.

### Retrofit & JSON Serialization

* `retrofit` — Organizes API requests through a type-safe client.
* `retrofit_generator` — Generates Retrofit implementation code.
* `json_annotation` — Defines JSON serialization metadata.
* `json_serializable` — Generates model serialization code.

The `http` package is also included in the project dependencies.

---

## 🛠️ Technologies & Packages

### Core Development

* Flutter
* Dart

### State Management

* `flutter_bloc`
* `provider`

### Networking & API

* `dio`
* `http`
* `pretty_dio_logger`
* `retrofit`
* `retrofit_generator`

### Dependency Injection

* `get_it`
* `injectable`
* `injectable_generator`

### Local Storage & Connectivity

* `hive_ce`
* `hive_ce_flutter`
* `shared_preferences`
* `connectivity_plus`

### UI & User Experience

* `flutter_screenutil`
* `cached_network_image`
* `webview_flutter`
* `cupertino_icons`

### Localization & Date Formatting

* `flutter_localizations`
* `intl`
* `timeago`

### JSON Serialization & Code Generation

* `json_annotation`
* `json_serializable`
* `build_runner`

### Development & Testing

* `flutter_test`
* `flutter_lints`

---

## 🚀 Getting Started

### Requirements

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or Physical Device
* News API Key

### Installation

1. Clone the repository:

   ```bash
   git clone YOUR_REPOSITORY_URL
   ```

2. Navigate to the project directory:

   ```bash
   cd newsapp
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Generate the required code, if applicable:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Configure your News API key according to your project's API configuration.

6. Run the application:

   ```bash
   flutter run
   ```

---

## 💡 Development Principles

* Clean Architecture
* Repository Pattern
* SOLID Principles
* Clean Code
* Separation of Concerns
* Dependency Injection
* Reusable Components
* Structured Error Handling
* Responsive UI Design

---

## 👨‍💻 Developer

**Eng. Omar Ahmed Ali**
Flutter / Mobile Application Developer

Built with Flutter and Dart, focusing on maintainable architecture, reusable components, efficient state management, API integration, and a responsive user experience.

---

## 🏷️ Tags

#Flutter #Dart #NewsApp #NewsAPI #FlutterDeveloper #MobileDevelopment #CleanArchitecture #RepositoryPattern #SOLID #CleanCode #BLoC #Cubit #Provider #DependencyInjection #GetIt #Injectable #Dio #Retrofit #JSONSerialization #Hive #LocalDatabase #SharedPreferences #ConnectivityPlus #WebView #FlutterLocalization #ResponsiveDesign #SoftwareEngineering #AppDevelopment
