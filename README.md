# Blood Gas Tracking App 🩸

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

A specialized mobile application designed for anesthesiology residents to efficiently track, analyze, and manage patient blood gas results. This app leverages on-device OCR to quickly digitize results from blood gas analyzers, ensuring data accuracy and saving time during critical surgeries.

## 🚀 Key Features

*   **⚡ Instant OCR Digitization**: Capture blood gas printouts using the camera. The app automatically parses pH, pCO2, pO2, Lactate, Glucose, and more.
*   **🔍 Split-Screen Verification**: Review OCR results side-by-side with the original image to ensure 100% accuracy before saving.
*   **📂 Patient Management**:
    -   **Active Tracking**: Real-time monitoring of patients currently in surgery.
    -   **Completed Archive**: Historical record of past surgeries.
    -   **Trash/Restore**: Soft-delete functionality to recover accidentally deleted records.
*   **📊 Visual Trends**: Dynamic charts visualization to track patient stability over time.
*   **🔒 Secure & Local**: All data is stored locally on the device using SQLite, ensuring patient privacy and zero latency.
*   **🌙 Health Theme**: Optimized Dark Mode (Teal/Health Palette) for low-light clinical environments.
*   **🇹🇷 Localization**: Fully localized for Turkish clinical terminology (Ameliyathane, Asistan, Hasta ID).

## 🛠️ Technology Stack

*   **Framework**: [Flutter](https://flutter.dev/)
*   **State Management**: [Riverpod](https://riverpod.dev/)
*   **Local Database**: [Drift (SQLite)](https://drift.simonbinder.eu/)
*   **OCR**: [Google ML Kit](https://developers.google.com/ml-kit/vision/text-recognition)
*   **Charts**: [FlChart](https://github.com/imaNNeo/fl_chart)
*   **Image Processing**: [Image Cropper](https://pub.dev/packages/image_cropper) & [Image Picker](https://pub.dev/packages/image_picker)

## 📸 Screenshots

| Dashboard | Split Screen OCR | Result Details |
|-----------|------------------|----------------|
| *(Add Dashboard Screenshot)* | *(Add Split Screen Screenshot)* | *(Add Details Screenshot)* |

## 🏁 Getting Started

### Prerequisites

*   Flutter SDK (3.0+)
*   Dart SDK
*   Android Studio / VS Code

### Installation

1.  **Clone the repository**
    ```bash
    git clone https://github.com/habipokc/blood-gas-app.git
    cd blood-gas-app
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the app**
    ```bash
    flutter run
    ```

### Code Generation (Drift/Riverpod)
If you modify database tables or providers, run the build runner:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
