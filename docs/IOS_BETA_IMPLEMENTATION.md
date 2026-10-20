# DogGuard iOS Beta Implementation Notes

Flutter is the shared app code for iOS and Android. The following UI work has been committed on `beta-rebuild`:

- Login view explicitly labels itself as a demo and warns not to enter a real password.
- Dashboard marks sample dog/health/expert data as demo content.
- Dog profiles can be added and edited locally during the current app session, with basic validation.
- Health records can be added locally during the current app session.
- Rescue view has a local-only report preparation form. It does not send a report, access location, or contact emergency services.
- Expert directory and profile clearly communicate which functions are not connected.
- Widget tests cover key demo behaviors.

These changes are UI-only and the data is held in memory. It is not an authenticated, multi-user, persisted product, and should not be advertised as a real safety or rescue service.

## Build and test

Use macOS with the required Flutter SDK and Xcode. From the repository root:

```bash
flutter doctor -v
flutter pub get
dart format lib test
flutter analyze
flutter test
```

Check whether `ios/Runner.xcworkspace` exists. If the iOS platform folder is missing, back up and commit changes before generating it:

```bash
flutter create --platforms=ios .
```

Then open the workspace in Xcode, set the unique Bundle Identifier and Apple Developer Team under Runner > Signing & Capabilities, and confirm the deployment target and app icon. Run on a physical iPhone before attempting a release build:

```flutter build ipa --release```

A signed build requires Apple's signing configuration and a valid developer account. The app must not be marked release-ready until build, analysis, tests, device checks, privacy review and TestFlight upload all succeed.

## Secrets

Never put an OpenAI private API key in Flutter/Dart source, app assets, build defines embedded in the bundle, or Git history. Route OpenAI requests through a trusted server-side endpoint and keep the key in server-side secret storage. Revoke credentials shared in plaintext.
