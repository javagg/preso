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
serverpod create-migration
dart bin/main.dart --apply-migrations
```
## generation
```
serverpod generate
```
## update tools
```
dart pub global activate serverpod_cli
```
## reinit database
```
cd server
docker compose down
docker volume rm [your_volume]
docker compose up -d

cd server/migrations
rm -rf your_migration

cd server
serverpod create-migration

flutter run -t lib/main.tool.dart
```