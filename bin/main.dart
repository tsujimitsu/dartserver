import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart' as shelf_static;
import 'package:dartwebserver/routes/app_routes.dart' as router;

Future<void> main() async {
  // Set routes
  final staticFileHandler =
      shelf_static.createStaticHandler('public', defaultDocument: 'index.html');
  final appHandler = router.AppRoutes().handler;

  // Set handler
  final cascadeHandler =
      Cascade().add(staticFileHandler).add(appHandler).handler;
  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  // Create server
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await shelf_io.serve(handler, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
