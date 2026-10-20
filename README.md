# DogGuard Beta 0.1.0

DogGuard is a Flutter starter app for dog owners. The current `beta-rebuild` branch is a **local UI demo**, not a production safety or rescue service.

## Features in this demo

- Demo entry screen with explicit no-authentication notice
- Dashboard with clearly marked sample data
- Add/edit dog profiles during the current session
- Add local health-record entries during the current session
- Prepare (but do not send) a lost/found dog report
- Expert categories marked as not yet connected
- Profile/settings screen that explains demo-only behavior
- Widget tests for selected demo flows

Data is held in memory and disappears when the app restarts. No real account is authenticated; health entries are not synced; no notifications are sent; location is not collected; rescue reports are not published; and the expert directory does not load real providers.

## Requirements

- Flutter SDK compatible with the declared Dart SDK constraint in `pubspec.yaml`
- For iOS builds: a Mac with Xcode and iOS tooling
- For TestFlight distribution: Apple Developer Program membership, a registered Bundle ID, App Store Connect app record and signing configuration

## Run and validate locally

From the repository root:

```bash
flutter doctor -v
flutter pub get
dart format lib test
flutter analyze
flutter test
```

Start an available device/emulator using `flutter devices`, then run `flutter run -d <device-id>`. Do not paste secrets in terminal output, source files or issue comments.

## iOS setup

1. Check that the `ios/` folder and `ios/Runner.xcworkspace` exist.
2. If the iOS project scaffolding is missing, first back up/commit the tree, then run `flutter create --platforms=ios .`.
3. Open the generated workspace in Xcode.
4. Set the registered Bundle Identifier, Team, signing and minimum iOS deployment target.
5. Run analysis and tests as shown above, then test on a physical iPhone.
6. Only after all release blockers are resolved, build with `flutter build ipa --release` and upload through Apple's supported workflow to App Store Connect/TestFlight.

See [docs/IOS_TESTFLIGHT.md](docs/IOS_TESTFLIGHT.md), [docs/IOS_BETA_IMPLEMENTATION.md](docs/IOS_BETA_IMPLEMENTATION.md), and [docs/SECURITY_AND_BETA_READINESS.md](docs/SECURITY_AND_BETA_READINESS.md).

## Security

Never put a private OpenAI API key or another server credential in Flutter/Dart source or the app bundle. Mobile packages can be inspected. Call OpenAI only from a trusted server endpoint with the key stored server-side. Revoke any credential that was shared in plaintext.

## Known blockers before real beta release

- Real authentication and per-account authorization
- Secure persistence and cloud synchronization
- Database security/RLS and data deletion/export
- Tested SOS delivery and location-sharing consent, if implemented
- Push notifications and maps/location, if included
- Real expert-provider integration and verification
- Privacy notices and matching App Store privacy disclosures
- Automated checks passing in a Flutter/Xcode environment
- Signed iOS archive, physical-device review and TestFlight validation

Do not describe this prototype as release-ready or as actually notifying rescue services until the relevant implementation has been built and tested.
