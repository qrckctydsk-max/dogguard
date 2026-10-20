# DogGuard iOS Beta Status

Updated: 2026-10-20

## Implemented in Flutter source on `beta-rebuild`

- Demo login now labels itself as non-authenticating and warns not to enter a real password.
- Dashboard identifies sample content as demo data.
- Dog profiles can be added and edited during the current session with basic input validation.
- Health records can be added during the current session.
- Missing/found dog report form prepares only a local demo record; no location is accessed and no report or SOS is sent.
- Expert directory/profile UI identifies unconnected features.
- Widget tests have been added for selected demo flows.
- README, iOS TestFlight instructions, security checklist and beta implementation notes are available in `docs/`.
- `.gitignore` now excludes common secret files and Apple signing material.
- A Flutter analyze/test workflow is present at `.github/workflows/flutter-ci.yml`.

## Not yet verified

- The current tool session has not produced a successful Flutter analysis or widget-test result. GitHub workflow/status queries returned no check runs for the inspected commit, so do not assume CI passed.
- iOS build scaffolding, signing, physical-device operation, and TestFlight upload have not been verified.
- The PR remains draft and unmerged; no changes have been merged into `main`.

## Critical release blockers

- Real backend authentication and per-account authorization.
- Durable, secure, owner-isolated storage and cloud sync.
- Fully implemented and tested SOS delivery semantics, maps/location consent, and push notifications if in scope.
- Real expert provider data and verification.
- Privacy notices, deletion/export flows, accessibility and offline/error handling.
- Successful CI, signed IPA, physical iPhone test, App Store Connect and TestFlight validation.

## Secret handling

The file `openai-api-key.txt` was shared as plaintext in the conversation. It was not copied into this source tree. Treat that credential as exposed and revoke it in the provider dashboard, then create a replacement. Revocation has not been confirmed here. Never embed an OpenAI private key in Flutter/Dart code or the mobile app bundle; use a trusted server-side endpoint instead.
