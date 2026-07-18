# CAPRICHO VAGARY - Complete Setup & Build Guide

## 📱 Flutter App Setup - Step by Step

### Table of Contents
1. [Prerequisites](#prerequisites)
2. [Environment Setup](#environment-setup)
3. [Firebase Configuration](#firebase-configuration)
4. [Project Setup](#project-setup)
5. [Building for Android](#building-for-android)
6. [Running the App](#running-the-app)
7. [Troubleshooting](#troubleshooting)
8. [Features Overview](#features-overview)
9. [Next Steps](#next-steps)

---

## Prerequisites

Before you begin, ensure you have:

### Required Software
- **Flutter SDK** (3.0.0 or higher)
  - Download: https://flutter.dev/docs/get-started/install
- **Dart SDK** (included with Flutter)
- **Android Studio** or **Android SDK Command-line Tools**
- **Java Development Kit (JDK)** 11 or higher
- **Git** for version control
- **Visual Studio Code** or another code editor

### Required Accounts
- **Firebase Account** (Google Cloud)
- **GitHub Account** (for version control)
- **Stripe Account** (for payments, optional)
- **Razorpay Account** (for payments, optional)

### System Requirements
- **Windows**: 64-bit OS, 4GB RAM minimum
- **macOS**: OS X 10.11 or later, 4GB RAM minimum
- **Linux**: 64-bit OS, 4GB RAM minimum

---

## Environment Setup

### Step 1: Install Flutter

**On Windows:**
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
# Extract to C:\flutter (recommended)

# Add to PATH:
# 1. Press Win+X and select "Edit environment variables"
# 2. Click "Environment Variables"
# 3. Click "New..." under "User variables"
# 4. Variable name: PATH
# 5. Variable value: C:\flutter\bin
# 6. Click OK
```

**On macOS:**
```bash
# Using Homebrew (recommended)
brew install flutter

# Or manually:
# 1. Download from https://flutter.dev/docs/get-started/install/macos
# 2. Extract to ~/flutter
# 3. Add to PATH in ~/.zshrc or ~/.bash_profile:
export PATH="$PATH:$HOME/flutter/bin"

# Apply changes
source ~/.zshrc  # or ~/.bash_profile
```

**On Linux:**
```bash
# Download and extract
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.0-stable.tar.xz
tar xf flutter_linux_3.10.0-stable.tar.xz

# Add to PATH in ~/.bashrc or ~/.zshrc:
export PATH="$PATH:$HOME/flutter/bin"

# Apply changes
source ~/.bashrc
```

### Step 2: Verify Installation

```bash
# Check Flutter installation
flutter --version

# Run flutter doctor
flutter doctor

# Output should show:
# ✓ Flutter (Channel stable, version 3.10.0)
# ✓ Android toolchain
# ✓ Android Studio
# ✓ VS Code
```

### Step 3: Install Android Studio

1. Download from https://developer.android.com/studio
2. Run the installer
3. Launch Android Studio
4. Go to **Preferences** → **Plugins** → Search "Flutter" → Install
5. Restart Android Studio

### Step 4: Create Android Emulator

```bash
# List available emulators
flutter emulators

# Create a new emulator
flutter emulators --create --name "Pixel_5_API_31"

# Launch the emulator
flutter emulators --launch Pixel_5_API_31

# Or use Android Studio:
# 1. Open Android Studio
# 2. Click "AVD Manager" (Tools → Device Manager)
# 3. Click "Create Device"
# 4. Select "Pixel 5" → Next
# 5. Select "API 31" → Next
# 6. Click "Finish"
```

---

## Firebase Configuration

### Step 1: Create Firebase Project

1. Go to https://console.firebase.google.com
2. Click "Add project"
3. Project name: `capricho-vagary`
4. Enable Google Analytics (optional)
5. Click "Create project"
6. Wait for setup to complete

### Step 2: Register Android App

1. In Firebase Console, click "Add app" → Select **Android**
2. Fill in:
   - **Package name**: `com.caprichovagary.app`
   - **App nickname**: `CAPRICHO VAGARY`
   - **Debug signing certificate SHA-1**: (leave empty for now)
3. Click "Register app"
4. Download `google-services.json`
5. Place it at: `android/app/google-services.json`

### Step 3: Get Debug Certificate SHA-1

```bash
# On Windows:
keytool -list -v -keystore %USERPROFILE%\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

# On macOS/Linux:
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Copy the SHA-1 value and add it to Firebase Console:
1. Firebase Console → Project Settings → Your Apps
2. Click on your Android app
3. Scroll to "SHA certificate fingerprints"
4. Click "Add fingerprint"
5. Paste the SHA-1
6. Click "Save"

### Step 4: Enable Firebase Services

**Authentication:**
1. Firebase Console → Authentication
2. Click "Get started"
3. Select "Email/Password"
4. Toggle "Enable"
5. Click "Save"

**Firestore Database:**
1. Firebase Console → Firestore Database
2. Click "Create database"
3. Select "Start in test mode" (for development)
4. Choose region (closest to you)
5. Click "Create"

**Cloud Storage:**
1. Firebase Console → Storage
2. Click "Get started"
3. Leave rules as default
4. Select storage location
5. Click "Done"

**Cloud Messaging:**
1. Firebase Console → Cloud Messaging
2. Note the Sender ID (for later)
3. Settings should be default

### Step 5: Download Firebase Configuration

```bash
# The google-services.json should already be downloaded
# Place it in: android/app/google-services.json

# Verify the file exists
ls -la android/app/google-services.json
```

---

## Project Setup

### Step 1: Clone Repository

```bash
# Clone the project
git clone https://github.com/caprichovagary1002/CAPRICHO-.git
cd CAPRICHO-

# Verify you're in the right directory
pwd
# Output should end with: .../CAPRICHO-
```

### Step 2: Get Dependencies

```bash
# Get all Flutter dependencies
flutter pub get

# Upgrade packages if needed
flutter pub upgrade

# Verify pubspec.yaml is correct
cat pubspec.yaml
```

### Step 3: Configure Environment

```bash
# Copy environment template
cp .env.example .env

# Edit .env with your credentials (use your preferred editor)
# nano .env  (on macOS/Linux)
# or use Visual Studio Code
```

**Update these values in `.env`:**
```env
FIREBASE_PROJECT_ID=capricho-vagary
FIREBASE_API_KEY=YOUR_WEB_API_KEY
FIREBASE_AUTH_DOMAIN=capricho-vagary.firebaseapp.com
FIREBASE_STORAGE_BUCKET=capricho-vagary.appspot.com
FIREBASE_MESSAGING_SENDER_ID=YOUR_SENDER_ID
FIREBASE_APP_ID=YOUR_APP_ID
```

To get these values:
1. Firebase Console → Project Settings (gear icon)
2. Click "Your apps" → Select your Android app
3. Scroll down to find all the credentials

### Step 4: Update Firebase Options

**Edit `lib/firebase_options.dart`:**

Replace `YOUR_ANDROID_API_KEY`, etc. with actual values from Firebase Console:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_API_KEY_HERE',
  appId: 'YOUR_ACTUAL_APP_ID_HERE',
  messagingSenderId: 'YOUR_ACTUAL_SENDER_ID_HERE',
  projectId: 'capricho-vagary',
  storageBucket: 'capricho-vagary.appspot.com',
);
```

---

## Building for Android

### Step 1: Clean Build

```bash
# Clean previous builds
flutter clean

# Delete build directory
rm -rf build/
rm -rf android/.gradle/

# Get dependencies again
flutter pub get
```

### Step 2: Check Setup

```bash
# Verify everything is configured
flutter doctor -v

# Should show:
# [✓] Flutter (Channel stable, x.x.x)
# [✓] Android toolchain - develop for Android devices
# [✓] Android Studio
# [✓] VS Code
```

### Step 3: Build APK (Debug)

```bash
# Build debug APK
flutter build apk --debug

# Output location:
# build/app/outputs/flutter-apk/app-debug.apk

# Build time: ~5-10 minutes (first build takes longer)
```

### Step 4: Build APK (Release)

```bash
# Build release APK
flutter build apk --release

# Output location:
# build/app/outputs/flutter-apk/app-release.apk

# For Google Play Store, build App Bundle instead:
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

---

## Running the App

### Option 1: Run on Emulator

```bash
# Terminal 1: Start emulator
flutter emulators --launch Pixel_5_API_31

# Wait for emulator to fully load (~1-2 minutes)
# You should see Android home screen

# Terminal 2: Run app
cd CAPRICHO-
flutter run

# App will compile and install
# Watch for errors in terminal
```

### Option 2: Run on Physical Device

```bash
# 1. Connect Android phone via USB
# 2. Enable Developer Mode:
#    - Go to Settings → About phone
#    - Tap "Build Number" 7 times
#    - Go back to Settings → Developer Options
#    - Enable "USB Debugging"

# 3. Trust the computer (prompt on phone)

# 4. Verify connection
flutter devices
# Should list your device

# 5. Run app
flutter run
```

### Option 3: Hot Reload/Restart

```bash
# While app is running in terminal:
# Press 'r' - Hot reload (fast, code changes only)
# Press 'R' - Full restart (slower, state reset)
# Press 'q' - Quit
```

### Expected Output on First Run

```
Running Gradle task 'assembleDebug'...
Built build/app/outputs/flutter-apk/app-debug.apk (xxx MB).
Installing build/app/outputs/flutter-apk/app-debug.apk...
Debug service listening on ws://127.0.0.1:xxxxx/
The Flutter DevTools debugger and profiler is available at: http://127.0.0.1:xxxxx

Flutter run key commands.
r Hot reload. 🔥🔥🔥
R Hot restart.
q Quit (terminate the Flutter process).
```

---

## Troubleshooting

### Issue 1: Gradle Build Failed

**Error:**
```
Gradle task assembleDebug failed with exit code 1
```

**Solution:**
```bash
# Clean and rebuild
flutter clean
rm -rf android/.gradle/
flutter pub get
flutter pub upgrade
flutter build apk --debug

# If still fails, check Java version
java -version
# Should be version 11 or higher

# Update local.properties
echo "java.version=11" >> android/local.properties
```

### Issue 2: Firebase Connection Error

**Error:**
```
PlatformException(FIREBASE_ERROR, ...)
```

**Solution:**
1. Verify `google-services.json` exists in `android/app/`
2. Check Firebase Console - all services enabled
3. Verify internet connection
4. Check Firebase credentials in `lib/firebase_options.dart`
5. Restart emulator: `flutter emulators --launch Pixel_5_API_31`

### Issue 3: Plugin Not Found

**Error:**
```
PlatformException: Plugin not found
```

**Solution:**
```bash
# Repair pub cache
flutter pub cache repair

# Get dependencies again
flutter pub get

# Upgrade packages
flutter pub upgrade

# Clean and rebuild
flutter clean
flutter build apk --debug
```

### Issue 4: Android SDK Not Found

**Error:**
```
Android SDK not found at ANDROID_HOME
```

**Solution:**
```bash
# Set ANDROID_HOME path

# On Windows:
set ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\sdk

# On macOS/Linux:
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Verify
flutter doctor -v
```

### Issue 5: NDK Not Found

**Error:**
```
NDK location not found
```

**Solution:**
```bash
# Add to android/local.properties:
ndk.dir=/path/to/ndk

# Or install via Android Studio:
# Android Studio → SDK Manager → SDK Tools → NDK (side by side)
```

### Issue 6: Emulator Stuck on Boot

**Solution:**
```bash
# Stop emulator
adb emu kill

# Clear emulator data
rm -rf $ANDROID_HOME/emulator/data

# Restart
flutter emulators --launch Pixel_5_API_31
```

---

## Features Overview

### ✂️ Barber Services
- Schedule appointments
- Choose service type and time slot
- View booking history
- Cancel bookings

### 👕 Fashion/Products
- Browse product catalog
- Filter by category
- View product details and pricing
- Add to cart (in development)

### 🏠 House-Call Bookings
- Schedule service at your location
- Real-time tracking
- Service provider details

### 💬 Messaging
- Direct chat with service providers
- Real-time notifications
- Message history

### 💳 Payments
- Secure payment processing
- Multiple payment methods
- Order tracking

### 👤 User Profile
- Manage account information
- View bookings and orders
- Update preferences
- Change password

---

## Next Steps

### After Running Successfully

1. **Test Authentication**
   - Sign up with email
   - Sign in with credentials
   - Test password reset

2. **Explore Features**
   - Try booking a service
   - Browse products
   - Check profile settings

3. **Customize for Your Business**
   - Update app colors and branding
   - Add your business information
   - Configure pricing
   - Add custom images/logos

4. **Set Up Payment Integration**
   - Add Stripe keys
   - Add Razorpay keys
   - Test payment flow

5. **Deploy to Google Play Store**
   - Create signed APK
   - Set up Google Play Developer account
   - Submit app for review

---

## Resources

- **Flutter Docs**: https://flutter.dev/docs
- **Firebase Docs**: https://firebase.google.com/docs
- **Android Dev**: https://developer.android.com/docs
- **Pub.dev Packages**: https://pub.dev

---

## Support & Troubleshooting

If you encounter issues:

1. Check the troubleshooting section above
2. Run `flutter doctor -v` to diagnose issues
3. Check Firebase Console logs
4. Review logcat output: `flutter logs`
5. Visit Flutter community forums: https://github.com/flutter/flutter/issues

---

**Happy coding! 🚀**

For questions or issues, contact: chepapemohale@gmail.com
