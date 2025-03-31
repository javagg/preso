# preso

## run server
```
cd server
docker compose up -d
dart bin/main.dart
```
## run admin console
```
cd client
flutter run -d chrome -t lib/main.web.dart
```
## migrations
```
cd server
serverpod create-migration #--experimental-features=inheritance
dart bin/main.dart --apply-migrations
```
## generation
```
serverpod generate #--experimental-features=inheritance
```
## update tools
```
dart pub global activate serverpod_cli
```