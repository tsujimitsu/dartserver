import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  final server = await shelf_io.serve(echo, 'localhost', 8080);
  print('Server running on http://${server.address.host}:${server.port}');
}

Response echo(Request request) =>
    Response.ok('Request for ${request.method} ${request.requestedUri}');
