import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test/serverpod_test.dart';
import 'package:test/test.dart';
import '../test/integration/test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Example endpoint', (sessionBuilder, endpoints) {
    test('when calling `hello` then should return greeting', () async {
      final greeting = await endpoints.example.hello(sessionBuilder, 'Michael');
      expect(greeting, 'Hello Michael');
    });
  });
}
