# DogGuard iOS / TestFlight Release Guide

Current source branch: `beta-rebuild`

This Flutter branch is a local UI prototype. CI validation on 2026-10-21 passed for formatting, analysis, widget tests, and an unsigned iOS build. No signed IPA or TestFlight upload has been verified. Do not distribute it as a production-ready safety app until authentication, data persistence, privacy controls, SOS behavior and tests have been implemented and reviewed.

## Build prerequisites

- A Mac that can run a supported version of Xcode
- Flutter SDK compatible with `pubspec.yaml`
- Xcode command-line tools and CocoaPods as required by Flutter
- An Apple Developer Program account for TestFlight distribution
- A unique bundle identifier and valid signing configuration

## First local build

1. Clone the repository and select `beta-rebuild`.
2. Run `flutter doctor -v` and resolve all iOS toolchain issues.
3. Run `flutter pub get`.
4. If the `ios/` platform folder is missing, create the iOS platform scaffolding from the Flutter project root with `flutter create --platforms=ios .` after committing or backing up local changes.
5. Open `ios/Runner.xcworkspace` in Xcode when present.
6. Configure the Bundle Identifier, Team, signing and capabilities in the Runner target.
7. Run `flutter analyze` and `flutter test`.
8. Test on a physical iPhone, especially permission prompts, app lifecycle, accessibility and network-loss behavior.
9. Build with `flutter build ipa --release` only after tests pass and production configuration is complete.
10. Upload the IPA through Xcode Organizer or Apple's supported upload workflow, then configure a TestFlight testing group in App Store Connect.

## Before inviting testers

- Replace demo authentication with a real identity provider and secure session handling.
- Implement backend authorization and database row-level security.
- Validate all user input and protect private dog/owner data.
- Add privacy disclosures and App Store privacy details that match actual data collection.
- Request location and notification permissions only when needed, with clear explanations.
- Design SOS as a user-confirmed workflow; clearly indicate what is sent, to whom and whether delivery succeeded. Never imply emergency services were contacted unless that is confirmed.
- Implement offline states, retries and safe synchronization for critical records.
- Test account deletion, export/deletion requests, error handling and recovery.
- Add automated tests and document known limitations for beta testers.

## Current limitation

Current verified status (2026-10-24): GitHub Actions run [39588980029](https://github.com/qrckctydsk-max/dogguard/actions/runs/39588980029) successfully compiled iOS with `--no-codesign`. That validates compilation only. This repository has no verified signed iOS archive or App Store Connect upload; TestFlight is not confirmed until signing and upload are completed in the required Apple/Xcode/App Store Connect environment.