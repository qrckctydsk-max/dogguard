# DogGuard — Beta Architecture

## Current scope

DogGuard Beta 0.1.0 is a Flutter UI prototype intended to establish the initial app structure. It is not a production-ready service.

## Application layers

- **Entry point:** `lib/main.dart` initializes Flutter and Riverpod's `ProviderScope`.
- **App shell and routing:** `lib/app.dart` configures Material 3 themes and GoRouter routes.
- **Feature screens:** `lib/features/` contains the login demo, dashboard, dog profiles, health record, rescue, expert directory, and profile/settings screens.
- **Tests:** `test/widget_test.dart` checks that the login screen renders.
- **Release notes:** `docs/BETA_RELEASE.md` records target distribution channels and production gaps.

## Routes

- `/login` — demo login screen
- `/` — dashboard
- `/dogs` — dog profile prototype
- `/health` — health record prototype
- `/rescue` — missing/found dog flow placeholder
- `/experts` — expert directory placeholder
- `/profile` — profile and settings prototype

## Known limitations

- Login currently navigates to the dashboard without authenticating credentials.
- Most buttons and settings are placeholders; data is not persisted.
- No backend, database, authorization rules, push notifications, maps, or real expert verification are connected.
- The sample dog and health details are demo content and must not be treated as real records.
- iOS/TestFlight distribution requires macOS, Xcode, valid signing assets, and store metadata.

## Recommended next implementation sequence

1. Run formatting, static analysis, and widget tests in CI.
2. Implement real authentication and secure per-user data access.
3. Add persistent dog profiles and health records with validation.
4. Implement rescue reporting with explicit privacy controls and location consent.
5. Add verified expert listings, notifications, and maps.
6. Complete privacy disclosures, platform signing, and beta distribution checks.

## Secrets

Do not commit API keys, signing credentials, tokens, or local `.env` files. The repository `.gitignore` excludes common local secret files. Any key exposed elsewhere must be rotated at its provider.
