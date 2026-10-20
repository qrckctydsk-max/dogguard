# DogGuard iOS Beta Implementation Notes

Flutter is the shared app code for iOS and Android. The current UI changes on `beta-rebuild` include:

- Login view explicitly labels itself as a demo and warns not to enter a real password.
- Dashboard marks sample dog/health/expert data as demo content.
- Dog profiles can be added and edited locally during the current session, with basic validation.
- Health records can be added locally during the current session.
- Rescue view has a local-only report preparation form. It does not send a report, access location, or contact emergency services.
- Expert directory and profile clearly communicate which functions are not connected.
- Widget tests cover demo behavior.

These changes are UI-only. Data is held in memory and lost when the app restarts. This is not an authenticated, multi-user, persistent product and must not be advertised as a real safety/rescue service.

## Build and test

Use macOS with a compatible Flutter SDK and Xcode. From the repository root:

```bash
flutter doctor -v
flutter pub get
dart format lib test
flutter analyze
flutter test
```

Check whether `ios/Runner.xcworkspace` exists. If the iOS platform folder is missing, back up/commit the tree before generating it:

```bash
flutter create --platforms=ios .
```

Open the workspace in Xcode, set the registered Bundle Identifier and Apple Developer Team under Runner > Signing & Capabilities, and confirm deployment target and app icon. Test on a physical iPhone before a release build:

```bash
flutter build ipa --release
```

A signed build requires Apple signing configuration and a valid developer account. Do not mark release-ready until build, analysis, tests, device checks, privacy review and TestFlight upload succeed.

## Secrets

Never put an OpenAI private API key in Flutter/Dart source, app assets, embedded build values or Git history. Route OpenAI requests through a trusted server-side endpoint and keep the key in server-side secret storage. Revoke credentials shared in plaintext.
