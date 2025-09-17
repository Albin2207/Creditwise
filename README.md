# CreditWise Capital

**A Flutter app showcasing financial info with interactive UI and API integration.**

---

## Overview
CreditWise Capital is a Flutter application built as part of a developer assignment. The app features clean navigation, scrollable dials, banner sliders, and interactive screens for financial information.

---

## Features
- Splash screen with app branding.
- Profile icon navigates to a menu screen.
- "Loan Info" button opens a screen with a scrollable dial.
- Banner images loaded dynamically from an API.
- Clean architecture with Provider for state management and GetIt for dependency injection.

---

## Screens
1. **Splash Screen**
2. **Profile/Menu Screen**
3. **Loan Info Screen** (scrollable dial)

---

## API
- **Banners API:** Fetches banner images dynamically.  
- **Endpoint:** `[Insert your API endpoint here]`

---

## Dependencies
- **provider** – State management  
- **get_it** – Dependency injection  
- **http** – API requests  
- **carousel_slider** – Banner slider  
- **cached_network_image** – Image caching  
- **sleek_circular_slider** – Scrollable dial  
- **flutter_launcher_icons** – App icon generation  

---

## Setup & Run
Clone the repo:

Navigate into the project:

cd creditwise_capital
Install dependencies:

flutter pub get
Generate app icons:

flutter pub run flutter_launcher_icons:main
Run the app:

flutter run
Build release APK:

flutter build apk --release