# Development

1. Install Flutter 3.22+ and Dart 3.3+.
2. Run `flutter pub get`.
3. Copy `.env.example` to the environment used by your deployment; do not commit secrets.
4. Apply the migration with Supabase CLI.
5. Run `dart format lib test` and `flutter analyze`.
6. Run `flutter test`.

The checked-in shell runs with demo data and does not claim that authentication, remote persistence, or payment processing is configured.
