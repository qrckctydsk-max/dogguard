# DogGuard Beta Security and Readiness

## Current state

The Flutter branch `beta-rebuild` is a UI prototype. It has navigation and screens for authentication, dogs, health records, rescue, experts and profile. This document is a checklist, not a claim that the release is ready.

## Secret handling

- Never commit `openai-api-key.txt`, `.env`, `.env.*`, access tokens, private keys or signing files.
- Keep secrets in local environment files ignored by Git or in the CI provider's encrypted secrets store.
- Never include a private OpenAI API key in Flutter or any other client-side app bundle. Mobile binaries can be inspected.
- If a key was uploaded or exposed in plaintext, revoke it in the provider dashboard and create a replacement. Do not rely on deleting the local file alone.
- Do not print key values, prefixes, hashes, lengths, or other derived identifiers in logs.
- Check whether secret-bearing files are tracked in every branch and review repository history before release. If committed, remove them and rotate the credential; deleting a file in a later commit does not erase Git history.

## Beta release blockers

- [ ] Replace demonstration authentication with verified provider-backed sign-in and session handling.
- [ ] Verify owner-level access controls and database row-level security.
- [ ] Store dog profiles and health records in an authenticated, privacy-reviewed backend.
- [ ] Keep owner contact information and precise location private by default.
- [ ] Implement and test SOS delivery semantics, retries, permissions and explicit user confirmation. Never imply emergency services have been contacted unless confirmed.
- [ ] Implement push notifications only with clear permission prompts and token lifecycle handling.
- [ ] Add robust offline, error, loading and empty states.
- [ ] Implement account deletion and data export rather than placeholder messages.
- [ ] Verify accessibility, localization and layouts on physical iPhones.
- [ ] Run `flutter doctor -v`, `flutter pub get`, `flutter analyze`, `flutter test` and an iOS release build on macOS/Xcode.
- [ ] Configure Apple signing and App Store Connect TestFlight.
- [ ] Document privacy nutrition labels and permissions matching actual behavior.

## iOS build outline

A signed IPA requires macOS/Xcode and valid Apple signing configuration. If iOS scaffolding is absent, back up and commit the working tree before generating it with `flutter create --platforms=ios .`. Configure the unique bundle identifier and team in Xcode, run analysis and tests, test on a physical device, then use `flutter build ipa --release` after all release blockers have been resolved. Upload through Xcode Organizer or Apple's supported upload workflow and configure a TestFlight group in App Store Connect.

## Verification record

Record only checks actually run, including date, commit, command, result and environment. A screenshot or static preview is not proof of backend authentication, push delivery, SOS delivery, or a signed iOS archive.