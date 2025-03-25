import 'package:serverpod/serverpod.dart';

void main(List<String> args) {
  run(args);
}

void run(List<String> args) {
  final server = Server();
  server.start();
}
