import 'serverpod_client.dart';

void main() async {
  await initializeServerpodClient();
  try {
    await client.maintenance.seed();
    print('Seeded!');
  } catch (e) {
    print('Error seeding: $e');
  }
}
