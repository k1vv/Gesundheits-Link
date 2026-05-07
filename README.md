# Gesundheits-Link

Gesundheits-Link is a mobile health and fitness monitoring application developed using Flutter. The app is designed to help users track health-related data, manage wellness activities, and access useful health monitoring features through a mobile platform.

This project is part of the Gesundheits-Link ecosystem, which also includes a companion Wear OS smartwatch application called **Gesundheits-Watch**.

## Companion Watch App

The smartwatch version of this project is available here:

**Gesundheits-Watch:**  
https://github.com/k1vv/Gesundheits-Watch

Gesundheits-Watch is a Wear OS health monitoring application that supports smartwatch-based health tracking such as heart rate, exercise, calories, distance, and activity monitoring. It is designed to work as the wearable companion app for the Gesundheits-Link ecosystem.

## Features

- User authentication using Firebase Authentication
- Health and fitness data tracking
- Health data integration using health-related APIs
- Firebase Realtime Database integration
- Firebase Storage integration
- Local data storage using SQLite
- Activity and exercise monitoring
- Location and map-based features
- QR code scanning support
- Local notification support
- Background task and foreground service support
- Bluetooth and sensor-related support
- Admin and user flow support
- Custom UI with health-focused visual components

## Tech Stack

### Mobile App

- Flutter
- Dart
- Firebase Authentication
- Firebase Realtime Database
- Firebase Storage
- SQLite / sqflite
- Provider
- GetX
- Flutter Map
- Geolocator
- Health package
- Local Notifications
- WorkManager
- Background Fetch
- Android Alarm Manager
- Flutter Blue Plus
- QR Code Scanner

### Watch App

The companion watch app uses:

- Kotlin
- Wear OS
- Jetpack Compose
- Android Health Services
- Firebase
- Hilt Dependency Injection
- ZXing QR Scanner
- Gradle

Watch app repository:  
https://github.com/k1vv/Gesundheits-Watch

## Project Structure

```text
Gesundheits-Link/
├── android/              # Android platform files
├── ios/                  # iOS platform files
├── lib/                  # Main Flutter source code
├── assets/               # Images and application assets
├── fonts/                # Custom font files
├── web/                  # Web platform files
├── windows/              # Windows platform files
├── macos/                # macOS platform files
├── linux/                # Linux platform files
├── pubspec.yaml          # Flutter dependencies and asset configuration
└── README.md             # Project documentation
