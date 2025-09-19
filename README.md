# RadioX

A beautiful radio player app built with Flutter that allows you to discover and listen to internet radio stations from around the world.

## Features

- 🎵 **Discover Radio Stations**: Browse trending radio stations
- ❤️ **Favorites**: Save your favorite stations with colorful category pills
- 🎛️ **Audio Controls**: Play, pause, and adjust volume
- ⏭️ **Station Navigation**: Skip between stations with next/previous buttons
- 💾 **Persistent Storage**: Your favorites are saved locally and persist between app launches

## Prerequisites

Before running this application, make sure you have:

- [Flutter](https://docs.flutter.dev/get-started/install) (SDK 3.8.1 or higher)
- [Dart](https://dart.dev/get-dart) (included with Flutter)
- iOS Simulator

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/arturograu/radiox
cd radiox
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

#### For Development:

```bash
flutter run
```

#### For Specific Platforms:

```bash
flutter run -d ios
```

### 4. Run Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## Project Structure

```
lib/
├── app/                    # App-level configuration and state
├── bootstrap.dart          # App initialization
├── home/                   # Home page with radio station discovery
├── radio_player/           # Radio player feature
├── shared/                 # Shared widgets and utilities
└── main.dart              # App entry point

packages/
├── radio_browser_api_client/    # API client for Radio Browser
├── radio_stations_repository/   # Radio stations data layer
└── user_repository/            # User data and favorites management
```

## Architecture

This project uses a feature-driven Flutter architecture with:

- **Feature-based organization**: Each feature (home, radio_player) in its own directory
- **Repository pattern**: Data layer abstraction with repositories
- **BLoC state management**: Reactive state management with flutter_bloc and cubits
- **Package structure**: Modular packages for API clients and repositories
- **Code generation**: Immutable models and state classes with freezed

## API

RadioX uses the [Radio Browser API](https://www.radio-browser.info/) to discover internet radio stations.

## Platform Support

- ✅ **iOS**: Supports iOS 12.0+

## Troubleshooting

### Common Issues

**Build Runner Issues:**

```bash
# Clean and rebuild generated files
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**iOS HTTP Streams:**
The app is configured to allow HTTP radio streams on iOS. If you encounter SSL issues, the Info.plist includes App Transport Security exceptions.

**Audio Playback Issues:**
Some radio stations may be offline or use unsupported formats. The app provides clear error messages and retry functionality.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
