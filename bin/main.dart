import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  final server = await shelf_io.serve(echo, InternetAddress.anyIPv4, 8080);
  print('Server running on http://${server.address.host}:${server.port}');
}

Response echo(Request request) => Response.ok(
    'Thank you for your access. Request for ${request.method} ${request.requestedUri} ${request.protocolVersion}');
