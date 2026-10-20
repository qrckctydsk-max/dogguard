# DogGuard iOS Beta Status

Updated: 2026-10-20

## Verified repository facts

- Flutter source branch: `beta-rebuild`
- Package version in `pubspec.yaml`: `0.1.0+1`
- App bundle target documented as `com.dogguard.app`
- Current files include login, dashboard, dog profiles, health records, rescue, experts and profile pages.
- Existing login screen routes to the dashboard when the button is pressed; the UI itself must not be treated as evidence of a verified account or secure backend session.
- A `test/widget_test.dart` exists, but a successful Flutter test run has not been verified in a macOS/Xcode environment as part of this change.
- A TestFlight archive/signature has not been produced or verified.

## Release blockers

- [ ] Install Flutter and validate `flutter doctor -v`.
- [ ] Run `flutter pub get`, `flutter analyze` and `flutter test`; fix any failures.
- [ ] Verify that `ios/Runner.xcworkspace` and iOS platform scaffolding exist. If absent, back up and commit before running `flutter create --platforms=ios .`.
- [ ] Configure bundle identifier, Apple Developer Team, provisioning/signing and any required entitlements in Xcode.
- [ ] Implement and test real backend authentication and session expiry.
- [ ] Persist dog and health data with per-account authorization; verify no sensitive data leaks between accounts.
- [ ] Implement SOS delivery with explicit permission, confirmation, delivery status, failure/retry handling and safety copy.
- [ ] Implement push notification service and permission lifecycle if included in scope.
- [ ] Review storage, telemetry, logs, privacy notices and App Store privacy declarations.
- [ ] Device-test on supported iPhones, including denied permissions, no network, empty data, errors, Dynamic Type and VoiceOver.
- [ ] Build a signed IPA using macOS/Xcode and upload to App Store Connect TestFlight.

## Credential incident handling

The user uploaded a file named `openai-api-key.txt` in this conversation. Do not copy its content into source, logs, issues or commits. Treat the credential as exposed and revoke it in the provider dashboard; then issue a replacement. Do not claim that revocation happened unless the provider confirms it. Never put a private provider key in a mobile client application.

## Status discipline

No release-ready, successful build, passing-tests, secure-storage, SOS-delivery or TestFlight claim may be made unless the corresponding check was actually executed and its output reviewed.