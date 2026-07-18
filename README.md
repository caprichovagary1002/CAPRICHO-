# CAPRICHO VAGARY

**A comprehensive barber, fashion, and house-call booking platform with integrated messaging, secure payments, and order tracking.**

## 📱 Features

### Core Features
- ✂️ **Barber Services** - Schedule appointments with professional barbers
- 👕 **Clothing Sales** - Browse and purchase exclusive fashion items
- 🏠 **House-Call Bookings** - Book services to be delivered at your location
- 💬 **Customer Messaging** - Direct communication with service providers
- 📦 **Product Management** - Full inventory management system
- 💳 **Secure Payments** - Integration with Stripe and Razorpay
- 📊 **Order Tracking** - Real-time order status updates
- ⭐ **Ratings & Reviews** - Customer feedback system
- 🗺️ **Location Services** - GPS integration for service delivery
- 🔔 **Push Notifications** - Real-time alerts and updates

## 🛠️ Technology Stack

### Frontend
- **Flutter** - Cross-platform mobile development
- **Dart** - Programming language
- **Provider** - State management
- **GetX** - Navigation and routing

### Backend & Services
- **Firebase** - Authentication, Firestore, Cloud Storage, Messaging
- **Stripe** - Payment processing
- **Razorpay** - Alternative payment gateway
- **Google Maps** - Location services

### UI/UX Libraries
- **Google Fonts** - Typography
- **Material Design 3** - UI components
- **Shimmer** - Loading animations
- **Lottie** - Advanced animations
- **Image Picker** - Media handling

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.0.0 or higher)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **Xcode** (for emulator)
- **Git**
- **Firebase Account**
- **Google Cloud Account**
- **Stripe/Razorpay Account**

### Installation Steps

1. **Install Flutter**
   - Visit [flutter.dev](https://flutter.dev/docs/get-started/install)
   - Follow the installation guide for your OS
   - Run `flutter doctor` to verify installation

2. **Clone the Repository**
   ```bash
   git clone https://github.com/caprichovagary1002/CAPRICHO-.git
   cd CAPRICHO-
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Configure Firebase**
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Enable Authentication (Email/Password)
   - Enable Firestore Database
   - Enable Cloud Storage
   - Enable Cloud Messaging
   - Download `google-services.json` for Android
   - Download `GoogleService-Info.plist` for iOS
   - Place files in the appropriate directories

5. **Update Firebase Configuration**
   - Edit `lib/firebase_options.dart` with your Firebase credentials

6. **Configure Payment Gateways**
   - Add Stripe and Razorpay keys to `.env` file
   - Copy `.env.example` to `.env` and fill in credentials

## 🚀 Running the App

### On Android Emulator
```bash
flutter emulators --launch Pixel_4_API_30
flutter run
```

### On Physical Android Device
```bash
# Connect device via USB
# Enable Developer Mode and USB Debugging
flutter run
```

### On iOS Simulator
```bash
open -a Simulator
flutter run
```

## 📁 Project Structure

```
CAPRICHO-/
├── lib/
│   ├── main.dart              # App entry point
│   ├── firebase_options.dart  # Firebase configuration
│   ├── config/
│   │   └── app_theme.dart     # Theme configuration
│   ├── providers/             # State management
│   │   ├── auth_provider.dart
│   │   ├── booking_provider.dart
│   │   ├── product_provider.dart
│   │   └── order_provider.dart
│   ├── routes/
│   │   └── app_routes.dart    # Navigation routes
│   ├── screens/               # UI screens
│   ├── widgets/               # Reusable widgets
│   ├── models/                # Data models
│   ├── services/              # API services
│   └── utils/                 # Utility functions
├── assets/
│   ├── images/
│   ├── icons/
│   ├── animations/
│   └── fonts/
├── android/                   # Android native code
├── ios/                       # iOS native code
├── pubspec.yaml               # Dependencies
├── .env.example               # Environment template
└── README.md                  # This file
```

## 🔐 Environment Variables

Create a `.env` file based on `.env.example`:

```env
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_API_KEY=your-api-key
STRIPE_PUBLISHABLE_KEY=your-stripe-key
RAZORPAY_KEY_ID=your-razorpay-key
```

## 📦 Build Commands

### Development Build
```bash
flutter build apk --debug
```

### Release Build
```bash
flutter build apk --release
```

### App Bundle (Google Play)
```bash
flutter build appbundle --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Generate coverage report
flutter test --coverage
```

## 🐛 Troubleshooting

### Common Issues

1. **"Flutter SDK not found"**
   - Run `flutter doctor` to check installation
   - Add Flutter to PATH if not already done

2. **"Gradle build failed"**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Try `flutter build apk --debug` again

3. **"Firebase connection error"**
   - Verify internet connection
   - Check Firebase configuration files
   - Ensure Firebase services are enabled

4. **"Plugin not found"**
   - Run `flutter pub get`
   - Run `flutter pub upgrade`
   - Delete `pubspec.lock` and run `flutter pub get` again

## 📚 Documentation

For detailed documentation:
- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Provider Documentation](https://pub.dev/packages/provider)
- [GetX Documentation](https://pub.dev/packages/get)

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support, email chepapemohale@gmail.com or create an issue in the repository.

## 🎯 Roadmap

- [ ] User authentication system
- [ ] Barber service booking
- [ ] Product catalog and shopping
- [ ] Real-time messaging
- [ ] Payment integration
- [ ] Order tracking
- [ ] Admin dashboard
- [ ] Analytics dashboard
- [ ] Multi-language support
- [ ] Offline mode

## 👨‍💼 Author

**Capricho Vagary Team**
- GitHub: [@caprichovagary1002](https://github.com/caprichovagary1002)
- Email: chepapemohale@gmail.com

---

**Project Phoenix** - Building the future of local service platforms 🚀
