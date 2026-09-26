# 🎉 News App

## 📰 News App

**News App** is a modern and responsive Flutter news application powered by **News API**, designed to help users **browse, discover, search, and read news articles** through a clean and user-friendly interface.

The application was developed by **Eng. Omar Ahmed Ali** as a Flutter project.

## ✨ Features

### 🏠 Home

* Browse the latest news
* Browse news by categories
* View news sources
* Display news articles
* Responsive and clean UI

### 📰 News Categories

* General
* Business
* Sports
* Technology
* Entertainment
* Health
* Science

### 🔎 Search

* Search for news articles
* Search by keywords
* Display matching news results

### 📖 News Details

* View complete news article information
* Display article title
* Display article image
* Display article description
* Display author
* Display publication time
* Open news articles using WebView

### 🌐 Localization

* English
* Arabic
* RTL support
* Switch application language
* Save selected language using **SharedPreferences**

### 🌓 Theme

* Light Mode
* Dark Mode
* Save selected theme using **SharedPreferences**
* Theme management using **Provider**

### ⏱️ Published Time

* Display relative publication time
* Example: `2 hours ago`
* Powered by **Timeago**

### 🖼️ Network Images

* Load news images from the API
* Cached network images
* Loading state
* Error handling for unavailable images

## 🏗️ Architecture & Development Practices

The application was developed using clean and maintainable coding practices.

* **Clean Architecture**
* **SOLID Principles**
* **Provider State Management**
* **BLoC / Cubit**
* Separation of Concerns
* Reusable Components
* Responsive UI
* API Integration
* Local Data Persistence
* Localization
* Error Handling
* Clean Code

## 🛠️ Built With

* **Flutter & Dart**
* **Dio** — API requests and network communication
* **Provider** — State Management
* **Flutter BLoC** — State Management
* **SharedPreferences** — Local data persistence
* **Flutter ScreenUtil** — Responsive UI
* **Flutter SVG** — SVG assets
* **CachedNetworkImage** — Network image caching
* **WebView Flutter** — Display web articles
* **Flutter Localizations** — Localization
* **Intl** — Internationalization and formatting
* **Timeago** — Relative date and time formatting

## 🌐 API Integration

The application uses **News API** to retrieve news data through **Dio**.

The API is used for:

* Fetching news sources
* Fetching news by category
* Fetching news articles
* Searching for news
* Retrieving article information

## 📱 News Categories

The application supports the following categories:

* **General**
* **Business**
* **Sports**
* **Technology**
* **Entertainment**
* **Health**
* **Science**

## 💾 Local Storage

**SharedPreferences** is used to save user preferences locally, including:

* Selected language
* Selected theme

The saved preferences are restored when the application starts again.

## 🎨 UI & Responsive Design

The application uses **Flutter ScreenUtil** to provide a responsive user interface across different screen sizes.

The project also uses:

* Custom reusable widgets
* SVG assets
* Cached network images
* Light and Dark themes
* Arabic RTL support

## 🚀 Getting Started

### Prerequisites

Make sure you have:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or Physical Device
* News API key

Navigate to the project:

```bash
cd news_app
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## 👨‍💻 Developer

**Eng. Omar Ahmed Ali**

**Flutter / Mobile Application Developer**

Built with **Flutter & Dart**, integrated with **News API**, and developed using **Clean Architecture, SOLID Principles, Provider, and BLoC State Management**.

#Flutter #Dart #NewsApp #NewsAPI #FlutterDeveloper #MobileDevelopment #CleanArchitecture #SOLID #Provider #BLoC #Dio #SharedPreferences #FlutterProjects
