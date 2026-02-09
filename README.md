<div align="center">

# 🚗 Riya Garage

**Your Ultimate Automotive Service Finder**

[![Flutter](https://img.shields.io/badge/Flutter-3.5.4+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Integrated-FFCA28?logo=firebase&logoColor=white)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue)](https://flutter.dev)

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Tech Stack](#-tech-stack) • [Contributing](#-contributing)

</div>

---

## 📖 About

**Riya Garage** is a comprehensive mobile application designed to help vehicle owners quickly find trusted automotive service providers in their area. Whether you need maintenance, spare parts, breakdown assistance, or tyre services, Riya Garage connects you with verified service providers for major vehicle brands including Honda, Suzuki, Toyota, Bajaj, and more.

---

## ✨ Features

### 🔍 **Smart Search & Filtering**
- Search service providers by **vehicle brand** (Honda, Suzuki, Toyota, Bajaj, etc.)
- Filter by **service type** (Maintenance, Spare Parts, Breakdown, Tyre Shops)
- Location-based search by **district and town**

### 🏢 **Service Provider Directory**
- Comprehensive database of verified service providers
- Provider details including name, contact, and services offered
- Direct call functionality to contact providers

### 💬 **Real-time Communication**
- Integrated chat system for direct messaging
- SMS viewing and management
- In-app communication with service providers

### 🗺️ **Location-Based Services**
- District-wise service provider listings
- Town/city-specific search capabilities
- Regional coverage across multiple areas

### 🔐 **Authentication & Security**
- Firebase Authentication integration
- Secure user data management
- Device tracking and identification

### 🎨 **User Experience**
- Clean and intuitive Material Design UI
- Brand-specific navigation screens
- Dynamic routing and screen transitions
- Responsive layout for various device sizes

---

## 📸 Screenshots

<div align="center">

| Home Screen | Service Search | Provider Details | Chat Interface |
|-------------|----------------|------------------|----------------|
| ![Home](docs/screenshots/home.png) | ![Search](docs/screenshots/search.png) | ![Details](docs/screenshots/details.png) | ![Chat](docs/screenshots/chat.png) |

</div>

> **Note:** Add your screenshots to the `docs/screenshots/` folder

---

## 🛠️ Tech Stack

### **Frontend**
- **Framework:** Flutter 3.5.4+
- **Language:** Dart
- **State Management:** Provider
- **UI Components:** Material Design, Cupertino Icons

### **Backend & Services**
- **Authentication:** Firebase Authentication
- **Database:** Cloud Firestore
- **Backend:** Firebase (BaaS)

### **Key Dependencies**
| Package | Purpose |
|---------|---------|
| `firebase_core` | Firebase initialization |
| `firebase_auth` | User authentication |
| `cloud_firestore` | NoSQL cloud database |
| `provider` | State management |
| `url_launcher` | Phone call functionality |
| `device_info_plus` | Device identification |
| `intl` | Internationalization and formatting |

---

## 🏗️ Project Structure

```
lib/
├── Controller/           # Business logic controllers
│   ├── PhoneCallFunction.dart
│   └── SearchFunction.dart
├── Model/               # Data models and providers
│   ├── DetailsProvider.dart
│   └── dataClass.dart
├── View/                # UI components and screens
│   ├── AppColors.dart
│   └── Screens/
│       ├── HomeScreen.dart
│       ├── DynamicScreen.dart
│       ├── DistrictsScreen.dart
│       ├── SearchTownScreen.dart
│       ├── SearchTownScreen2.dart
│       ├── chat_screen.dart
│       ├── all_sms_screen.dart
│       ├── Bajaj.dart
│       ├── Honda.dart
│       ├── Suzuki.dart
│       ├── Toyota.dart
│       └── Components/
├── Data/                # Static data and resources
└── main.dart            # Application entry point

assets/                  # Images and resources
android/                 # Android-specific files
ios/                     # iOS-specific files
```

---

## 🚀 Installation

### **Prerequisites**
- Flutter SDK (3.5.4 or higher)
- Dart SDK (3.5.4 or higher)
- Android Studio / VS Code
- Firebase account
- Android/iOS device or emulator

### **Setup Steps**

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/riya_garage_new.git
   cd riya_garage_new
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**
   
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable **Firebase Authentication** and **Cloud Firestore**
   - Download `google-services.json` (Android) and place in `android/app/`
   - Download `GoogleService-Info.plist` (iOS) and place in `ios/Runner/`

4. **Environment Variables**
   
   Create a `.env` file in the root directory (if needed):
   ```env
   # Firebase Configuration (if using environment variables)
   FIREBASE_API_KEY=your_api_key_here
   FIREBASE_PROJECT_ID=your_project_id
   FIREBASE_APP_ID=your_app_id
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 🔧 Configuration

### **Firebase Firestore Structure**

```
firestore/
├── {brand}/            # e.g., honda, suzuki, toyota
│   └── {category}/     # maintenance, spareparts
│       └── {city}/     # city name
│           └── {doc}   # provider details
│               ├── name
│               ├── id
│               ├── call
│               └── des
└── {service}/          # breakdown, tyreshops
    └── districts/
        └── {city}/
            └── {doc}   # provider details
```

---

## 📱 Usage

1. **Launch the app** - Opens to the dynamic screen
2. **Select vehicle brand** - Choose from Honda, Suzuki, Toyota, Bajaj, etc.
3. **Choose service type** - Maintenance, Spare Parts, Breakdown, or Tyre Shops
4. **Select location** - Pick your district and town
5. **View providers** - Browse list of service providers in your area
6. **Contact directly** - Call or chat with providers

---

## 🏛️ Architecture

The app follows the **MVC (Model-View-Controller)** pattern:

- **Model:** Data classes and Firebase integration (`dataClass.dart`, `DetailsProvider.dart`)
- **View:** UI screens and components (Screens folder)
- **Controller:** Business logic and functionality (Controller folder)

### **State Management**
Uses **Provider** pattern for efficient state management and data flow across the application.

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze
```

---


<div align="center">

⭐ Star this repo if you find it helpful!

</div>
