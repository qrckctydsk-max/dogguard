# DogGuard iOS Beta Status

Updated: 2026-10-20
Bundle ID target: `com.credibilitylions.dogguard`

## Implemented on `beta-rebuild`

- Demo UI clearly labels login and sample content; no real authentication is performed.
- Dog profiles and health records can be entered locally during the current session.
- Missing/found dog report form only prepares a local demo record; no location is accessed and no SOS/report is sent.
- Expert directory and profile identify unconnected features.
- Widget tests cover selected demo flows.
- GitHub Actions workflow runs Flutter formatting, analysis and tests, requests an unsigned iOS build on macOS, and prepares an Android debug APK artifact.

## Current verification state

- Bundle ID selected for the app: `com.credibilitylions.dogguard`.
- The iOS Xcode project file `ios/Runner.xcodeproj/project.pbxproj` was not found in the checked `beta-rebuild` branch. The iOS project scaffolding must be generated and committed before a standard iOS build can succeed.
- No successful Flutter analyze/test or iOS build result has been confirmed in this tool session. Do not assume CI passed.
- Apple signing, physical iPhone validation, App Store Connect setup and TestFlight upload have not been verified.
- The pull request remains draft/unmerged; `main` has not been changed by the pull request.

## Required next actions

1. Generate/check in iOS scaffolding on macOS using a compatible Flutter SDK (first back up the branch), then set the Runner bundle identifier to `com.credibilitylions.dogguard`.
2. Open `ios/Runner.xcworkspace` in Xcode and choose the correct Apple Developer Team under Signing & Capabilities. Confirm automatic signing and the registered App ID match this Bundle ID.
3. Run `flutter pub get`, `dart format --output=none --set-exit-if-changed lib test`, `flutter analyze`, `flutter test`, and `flutter build ios --release --no-codesign`.
4. Fix all build/test errors; test on a physical iPhone.
5. Create/confirm the matching app record in App Store Connect, archive/sign and upload using Xcode or `flutter build ipa --release` on the authorized Mac, then validate the build in TestFlight.

## Product readiness blockers

This branch is still a UI prototype: real authentication and authorization, secure persistent storage/cloud sync, production SOS and consent handling, real provider data, privacy/data deletion flows, offline/error handling and end-to-end testing remain outstanding. Do not advertise it as a functioning safety/rescue service until implemented and tested.

## Security

Never commit Apple signing credentials, API keys, certificates with private keys, or provisioning secrets. Any API key shared in plaintext should be revoked in the provider dashboard; revocation is not confirmed here. Private OpenAI keys must remain on a trusted server-side endpoint, never in the mobile app bundle.
