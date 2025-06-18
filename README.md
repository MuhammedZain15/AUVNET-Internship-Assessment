# AUVNET Internship Assessment

A Flutter-based mobile application built with clean architecture principles and modern development practices. This food delivery app features user authentication, location services, and real-time data from Firebase.

### 🎮 Video Demonstration

[🎥 Watch App Demo](https://drive.google.com/file/d/1-sTZ4Vc_6FSzmudM7fz02RrlUMfKZJ9I/view?usp=drive_link)

## 🚀 Project Setup and Installation Guide

### Prerequisites

- Flutter SDK (version 3.8.0 or higher)
- Dart SDK (version 3.8.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Git
- Firebase project setup

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/MuhammedZain15/AUVNET-Internship-Assessment.git
   cd AUVNET-Internship-Assessment55
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Authentication (Email/Password)
   - Enable Firestore Database
   - Download `google-services.json` for Android and place it in `android/app/`
   - Download `GoogleService-Info.plist` for iOS and place it in `ios/Runner/`
   - Configure Firestore security rules

4. **Firestore Data Structure**
   Create the following collections in Firestore:

   ```
   - users (for user profiles)
   - slider-images (for home slider)
   - nearby-restaurant (for restaurant data)
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

## 🏗️ Architectural Overview

The project follows Clean Architecture principles with a feature-first approach, implementing Domain-Driven Design (DDD) patterns.

### Project Structure

```
lib/
├── core/                           # Core functionality and utilities
│   ├── common/                     # Shared components
│   │   ├── helper/                 # Helper services
│   │   └── widgets/                # Shared widgets
│   ├── config/                     # App configuration
│   │   ├── assets/                 # Asset constants
│   │   ├── theme/                  # App theming
│   │   └── app_data.dart           # Static app data
│   └── errors/                     # Error handling
├── feature/                        # Feature modules
│   ├── auth/                       # Authentication feature
│   │   ├── data/                   # Data layer
│   │   ├── domain/                 # Domain layer
│   │   └── presentation/           # Presentation layer
│   ├── home/                       # Home feature
│   │   ├── data/                   # Data layer
│   │   ├── domain/                 # Domain layer
│   │   └── presentation/           # Presentation layer
│   ├── onboarding/                 # Onboarding feature
│   └── splash_screen.dart          # Splash screen
└── main.dart                       # Application entry point
```

### Architecture Layers

#### 1. **Domain Layer** (Business Logic)

- **Entities**: Core business objects (User, Restaurant, etc.)
- **Repositories**: Abstract interfaces for data access
- **Use Cases**: Business logic and operations
- **Failures**: Error handling and exceptions

#### 2. **Data Layer** (Data Management)

- **Data Sources**: Remote (Firebase) and Local (Hive) data sources
- **Repository Implementations**: Concrete implementations of domain repositories
- **Models**: Data transfer objects (DTOs)

#### 3. **Presentation Layer** (UI)

- **Blocs**: State management using BLoC pattern
- **Pages**: Screen implementations
- **Widgets**: Reusable UI components

### Key Technologies and Libraries

- **State Management**: Flutter Bloc for predictable state management
- **Dependency Injection**: GetIt for service locator pattern
- **Backend Services**:
  - Firebase Authentication for user management
  - Cloud Firestore for real-time database
- **Local Storage**: Hive for offline data persistence
- **UI Components**:
  - Flutter ScreenUtil for responsive design
  - Flutter SVG for vector graphics
  - Custom widgets for consistent UI
- **Location Services**:
  - Geolocator for location tracking
  - Geocoding for address lookups
- **Navigation**: Custom navigation with persistent state

### Architecture Rationale

1. **Clean Architecture Benefits**

   - **Separation of Concerns**: Each layer has a specific responsibility
   - **Testability**: Business logic is independent and easily testable
   - **Maintainability**: Changes in one layer don't affect others
   - **Scalability**: Easy to add new features without breaking existing code
   - **Framework Independence**: Business logic is not tied to Flutter or Firebase


3. **BLoC Pattern for State Management**

   - **Predictable State Changes**: Unidirectional data flow
   - **Reactive Programming**: UI automatically updates when state changes
   - **Testability**: Business logic is separated from UI
   - **Debugging**: Easy to track state changes and debug issues

4. **Dependency Injection with GetIt**
   - **Loose Coupling**: Components don't create their own dependencies
   - **Testability**: Easy to mock dependencies for testing
   - **Singleton Management**: Efficient resource management
   - **Lifecycle Management**: Proper initialization and disposal

## 📱 Features

### Core Features

- **User Authentication**: Sign up, sign in, and profile management
- **Location Services**: Real-time location tracking and address lookup
- **Home Dashboard**: Dynamic content with slider images and restaurant listings
- **Offline Support**: Local data caching with Hive
- **Responsive Design**: Adapts to different screen sizes

### Technical Features

- **Real-time Data**: Live updates from Firestore
- **State Management**: Predictable state changes with BLoC
- **Error Handling**: Comprehensive error management and user feedback
- **Performance**: Optimized data loading and caching
- **Cross-platform**: Works on both Android and iOS

## 🔧 Development Guidelines

### Code Style

- Follow Flutter's official style guide
- Use meaningful variable and function names
- Write clear and concise comments
- Implement proper error handling

### Architecture Patterns

- Always follow Clean Architecture principles
- Use BLoC for state management
- Implement proper dependency injection
- Write unit tests for business logic

### Version Control

- Use meaningful commit messages
- Follow Git flow branching strategy
- Keep commits atomic and focused
- Document major changes

## 📄 License

This project is proprietary and confidential. Unauthorized copying, distribution, or use is strictly prohibited.

## 🤝 Contributing

For internal development team use only. Please follow the established coding standards and architecture patterns when contributing to this project.
