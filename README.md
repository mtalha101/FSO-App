<p align="center">
  <img src="https://img.icons8.com/3d-fluency/94/service-bell.png" alt="FSO Logo" width="120" height="120"/>
</p>

<h1 align="center">FSO - Field Service Operations</h1>

<p align="center">
  <strong>Concierge Service Platform for Expatriates in Egypt</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.1.0+-02569B?logo=flutter" alt="Flutter Version"/>
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey" alt="Platform"/>
  <img src="https://img.shields.io/badge/Firebase-Backend-FFCA28?logo=firebase" alt="Firebase"/>
  <img src="https://img.shields.io/badge/BLoC-State_Management-01579B" alt="BLoC"/>
</p>

---

## 📖 Overview

**FSO (Field Service Operations)** is a comprehensive concierge service mobile application designed for Yemeni expatriates living in Egypt. The platform connects users with a wide range of essential services including immigration assistance, embassy services, airport transfers, medical support, and more.

### 🎯 The Problem

Expatriates face numerous challenges navigating services in a foreign country:

- Complex immigration and visa procedures
- Language barriers when dealing with government offices
- Difficulty finding reliable service providers
- Time-consuming paperwork for embassy and consulate services
- Lack of knowledge about local systems and requirements
- No centralized platform for requesting assistance

### 💡 The Solution

FSO delivers:

- **Service Categories**: 9+ categories covering all essential expat needs
- **Document Management**: Upload and manage required documents digitally
- **Request Tracking**: Monitor service request status in real-time
- **Professional Network**: Connect with verified service providers
- **Secure Platform**: Firebase-powered authentication and data storage

---

## 👨‍💻 My Role & Contributions

As the **Lead Flutter Developer**, I was responsible for:

### Core Development

- 🏗️ **Architected** the entire Flutter application with clean BLoC architecture
- 📱 **Built** 4 core feature modules (Authentication, Home, Profile, Requests)
- 📝 **Implemented** dynamic form system with 40+ input field types
- 🔐 **Integrated** Firebase Authentication, Firestore, and Storage

### Technical Challenges Solved

- ⚡ **Dynamic Forms**: Built flexible input system based on service requirements
- 📸 **Document Upload**: Multi-image picker with Firebase Storage integration
- 🏗️ **Category System**: Nested service categories with dynamic sub-categories
- 🎨 **Custom Widgets**: Reusable buttons, text fields, and dropdowns

### Backend & Infrastructure

- ☁️ **Firebase Firestore**: Designed data models for users and service requests
- 🔐 **Firebase Auth**: Email/password authentication with password reset
- 📦 **Firebase Storage**: Secure document and image storage
- 🎯 **BLoC Pattern**: Clean state management with events and states

---

## 📊 Impact & Results

<p align="center">
  <table>
    <tr>
      <td align="center">
        <h3>9+</h3>
        <p>Service Categories</p>
      </td>
      <td align="center">
        <h3>40+</h3>
        <p>Service Types</p>
      </td>
      <td align="center">
        <h3>Real-time</h3>
        <p>Request Tracking</p>
      </td>
      <td align="center">
        <h3>Secure</h3>
        <p>Document Storage</p>
      </td>
    </tr>
  </table>
</p>

### Key Achievements

- 📱 **Streamlined** service request process for expatriates
- 📝 **Dynamic** form generation based on service requirements
- 🔒 **Secure** document upload and storage system
- ⚡ **Real-time** request status updates

---

## ✨ Key Features

### 📱 Service Categories

| Category                           | Services Included                                         |
| ---------------------------------- | --------------------------------------------------------- |
| **Cairo Airport Services**         | VIP services, transfers, security approval, facilities    |
| **Car Services**                   | Rentals, repairs, driver hire, driving licenses           |
| **Educational Services**           | Course booking, private teachers                          |
| **Immigration & Passport**         | Residence permits, arrival stamps, work permits           |
| **Medical Services**               | PCR tests, vaccination certificates, doctor referrals     |
| **Mobile Services**                | SIM cards, balance recharge, balance transfer             |
| **Tourism Services**               | Flight booking, hotels, Umrah visa                        |
| **Embassy/Consulate Services**     | Passport issuance, stamps, authorizations, verifications  |
| **Other Services**                 | Maid services, cleaning, cooking                          |

### 📝 Request System

| Feature                 | Description                                         |
| ----------------------- | --------------------------------------------------- |
| **Create Request**      | Select category, service, and fill required details |
| **Document Upload**     | Upload passport, photos, and supporting documents   |
| **Review & Submit**     | Review all information before submission            |
| **Track Status**        | Monitor request progress in real-time               |
| **Recent Requests**     | View history of all submitted requests              |

### 👤 User Management

| Feature                | Description                              |
| ---------------------- | ---------------------------------------- |
| **User Registration**  | Email/password signup                    |
| **Secure Login**       | Firebase authentication                  |
| **Profile Management** | Edit personal information                |
| **Password Reset**     | Forgot password with email recovery      |
| **Change Password**    | Update password from settings            |

---

## 🏗️ Architecture

### System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                        FSO ARCHITECTURE                             │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────────┐     ┌──────────────┐                              │
│  │   Flutter    │     │   Flutter    │                              │
│  │     iOS      │     │   Android    │                              │
│  └──────┬───────┘     └──────┬───────┘                              │
│         │                    │                                      │
│         └─────────┬──────────┘                                      │
│                   │                                                 │
│         ┌─────────▼─────────┐                                       │
│         │    Flutter BLoC   │                                       │
│         │ State Management  │                                       │
│         └─────────┬─────────┘                                       │
│                   │                                                 │
│    ┌──────────────┼──────────────┐                                  │
│    │              │              │                                  │
│  ┌─▼──────┐  ┌────▼─────┐   ┌────▼─────┐                            │
│  │Firebase│  │ Firebase │   │ Firebase │                            │
│  │  Auth  │  │Firestore │   │ Storage  │                            │
│  └─┬──────┘  └────┬─────┘   └────┬─────┘                            │
│    │              │              │                                  │
│  ┌─┴──────────────┴──────────────┴────┐                             │
│  │ • Email/Password Authentication    │                             │
│  │ • User Profiles & Preferences      │                             │
│  │ • Service Requests & Status        │                             │
│  │ • Document & Image Storage         │                             │
│  └────────────────────────────────────┘                             │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Project Structure

```
lib/
├── main.dart                    # App entry point
├── firebase_options.dart        # Firebase configuration
│
├── core/                        # Core utilities
│   ├── constants/
│   │   ├── categories.dart      # Service categories & sub-categories
│   │   ├── colors.dart          # App color palette
│   │   ├── enums.dart           # App enumerations
│   │   ├── literals.dart        # String constants
│   │   └── spacings.dart        # Spacing values
│   ├── extensions/
│   │   └── string.dart          # String extensions
│   └── widgets/
│       ├── button.dart          # Custom button widget
│       └── textfield.dart       # Custom text field widget
│
├── features/                    # Feature modules
│   ├── authentication/          # 🔐 Auth Feature
│   │   ├── bloc/
│   │   │   ├── bloc.dart
│   │   │   ├── events.dart
│   │   │   └── states.dart
│   │   ├── screens/
│   │   │   ├── login_screen.dart
│   │   │   ├── signup_screen.dart
│   │   │   └── forgot_screen.dart
│   │   └── service/
│   │       └── auth_service.dart
│   │
│   ├── home/                    # 🏠 Home Feature
│   │   ├── screens/
│   │   │   ├── nav_screen.dart
│   │   │   └── tabs/
│   │   │       ├── home_screen.dart
│   │   │       ├── profile_screen.dart
│   │   │       └── recent_requests_screen.dart
│   │   ├── utils/
│   │   │   └── input_data.dart  # Form data model
│   │   └── widgets/
│   │       ├── date_time_widget.dart
│   │       ├── dropdown_widget.dart
│   │       ├── image_picker_widget.dart
│   │       ├── input_field_displays.dart
│   │       └── service_widget.dart
│   │
│   ├── profile/                 # 👤 Profile Feature
│   │   └── screens/
│   │       ├── edit_profile_screen.dart
│   │       └── change_password_screen.dart
│   │
│   └── request/                 # 📝 Request Feature
│       └── screens/
│           ├── create_request_screen.dart
│           ├── review_submission_screen.dart
│           └── submit_request_screen.dart
```

### BLoC Architecture Pattern

```
feature/
├── bloc/
│   ├── bloc.dart        # BLoC logic
│   ├── events.dart      # Input events
│   └── states.dart      # Output states
├── screens/             # UI screens
├── service/             # API/Firebase services
└── widgets/             # Feature widgets
```

---

## 🧩 Technical Challenges & Solutions

### 1. Dynamic Form System

**Challenge**: Different services require different input fields and documents.

**Solution**:

- Built `InputData` class with 40+ optional fields
- Created dynamic form widgets that show/hide based on service type
- Implemented conditional validation per service requirements
- Reusable input field display components

**Result**: Single codebase handles all 40+ service types.

### 2. Multi-Image Document Upload

**Challenge**: Users need to upload multiple document types (passport, tickets, photos).

**Solution**:

- Integrated `image_picker` for camera and gallery selection
- Built custom `ImagePickerWidget` with preview capability
- Firebase Storage integration with progress tracking
- Separate URL lists for each document type

**Result**: Reliable document upload with visual feedback.

### 3. Nested Category System

**Challenge**: Services organized in hierarchical categories and sub-categories.

**Solution**:

- Static category mapping in `ServiceCategory` class
- Dynamic dropdown population based on selected category
- Type-safe sub-category access with null safety
- Clean UI with cascading dropdowns

**Result**: Intuitive service discovery for users.

### 4. Request Tracking

**Challenge**: Users need to track status of submitted service requests.

**Solution**:

- Firestore real-time listeners for status updates
- Timeago integration for human-readable timestamps
- Recent requests tab with filtering capability
- Status-based UI indicators

**Result**: Real-time visibility into request progress.

---

## 🛠️ Tech Stack

### Frontend

| Technology           | Purpose                       |
| -------------------- | ----------------------------- |
| Flutter 3.1.0+       | Cross-platform UI framework   |
| Flutter BLoC         | State management              |
| Equatable            | Value equality for BLoC       |
| DM Sans Font         | Custom typography             |

### Backend & Database

| Technology         | Purpose                        |
| ------------------ | ------------------------------ |
| Firebase Firestore | Real-time NoSQL database       |
| Firebase Auth      | Email/password authentication  |
| Firebase Storage   | Document and image storage     |

### UI Components

| Technology           | Purpose                    |
| -------------------- | -------------------------- |
| Flutter SVG          | Vector icon rendering      |
| Cached Network Image | Image caching              |
| Zoom Widget          | Document zoom/preview      |

### Utilities

| Technology    | Purpose                   |
| ------------- | ------------------------- |
| Image Picker  | Camera/gallery selection  |
| Intl          | Date/time formatting      |
| Timeago       | Relative time display     |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.1.0+
- Xcode 15+ (iOS)
- Android Studio (Android)
- Firebase CLI
- CocoaPods (iOS)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-repo/fso-app.git

# 2. Install dependencies
flutter pub get

# 3. Configure Firebase
flutterfire configure

# 4. iOS setup
cd ios && pod install && cd ..

# 5. Generate splash screen
flutter pub run flutter_native_splash:create

# 6. Run the app
flutter run
```

### Build Commands

```bash
# Development
flutter run

# Production (Android)
flutter build apk --release

# Production (iOS)
flutter build ipa --release
```

---

## 🔐 Security & Best Practices

- ✅ **Firebase Security Rules**: Granular access control on Firestore
- ✅ **Secure Authentication**: Email verification and password reset
- ✅ **Document Privacy**: User-specific storage paths
- ✅ **Input Validation**: Comprehensive form validation
- ✅ **Secure Storage**: Firebase Storage with access rules

---

## 📋 Service Details

### Airport Services
- VIP arrival/departure assistance
- Security approval processing
- Airport transfers (to/from)
- Facility access management

### Immigration Services
- Student residence (annual)
- Work residence permits
- 6-month residence cards
- Arrival stamps
- Legal document translation

### Embassy Services
- New passport issuance
- Replacement passport
- Data transfer between passports
- Embassy authorizations
- Address verification
- Official stamps

### Tourism Services
- Airline ticket booking
- Hotel reservations
- Umrah visa (electronic)

---

## 🔮 Future Roadmap

- [ ] Push notifications for request updates
- [ ] In-app chat with service providers
- [ ] Payment integration
- [ ] Multi-language support (Arabic/English)
- [ ] Service provider dashboard
- [ ] Rating and review system
- [ ] Offline request drafts

---

## 📬 Contact

**Muhammad Talha**

- 📧 Email: m.talhaarshad98@gmail.com
- 💼 LinkedIn: [linkedin.com/in/tvlhv](https://linkedin.com/in/tvlhv)
- 🐙 GitHub: [github.com/mtalha101](https://github.com/mtalha101)

---

<p align="center">
  <sub>Built with ❤️ using Flutter</sub>
</p>
