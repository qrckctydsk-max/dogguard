# DogGuard iOS Bundle ID

Bundle Identifier: `com.credibilitylions.dogguard`

Use this exact identifier consistently in:
- Apple Developer portal → Identifiers → App IDs
- Xcode project → Runner target → Signing & Capabilities → Bundle Identifier
- App Store Connect app record

## Current repository state

The checked `beta-rebuild` branch does not contain `ios/Runner.xcodeproj/project.pbxproj`. Therefore, setting the Bundle ID in the repository's Xcode project is currently blocked until iOS scaffolding is generated and committed.

## Next steps on an authorized Mac

From the repository root, first ensure the branch is backed up and the Flutter SDK is installed:

```bash
flutter doctor -v
flutter pub get
flutter create --platforms=ios .
```

Review all generated changes before committing. Open `ios/Runner.xcworkspace` in Xcode, set the Runner bundle identifier to `com.credibilitylions.dogguard`, select the correct Apple Developer Team, and enable automatic signing as appropriate.

Then run:

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
flutter build ios --release --no-codesign
```

The unsigned build is only a compile check; it is not a TestFlight package. To distribute, validate the App ID and App Store Connect record, sign/archive on the authorized Mac, upload, and validate the build in TestFlight.

Do not commit Apple credentials, private keys, provisioning secrets, certificates containing private keys, or API keys. Do not mark this prototype production-ready until its real backend, security, privacy, rescue/SOS behavior, tests and physical-device checks are complete.
