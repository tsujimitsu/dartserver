import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart' as shelf_static;
import 'package:shelf_cors_headers/shelf_cors_headers.dart' show corsHeaders;
import 'package:dartserver/routes/app_routes.dart' as router;
import 'package:dartserver/helpers/database_provider.dart'
    show DatabaseProvider;

Future<void> main() async {
  // init db
  DatabaseProvider.init();

  // set routes
  final staticFileHandler =
      shelf_static.createStaticHandler('public', defaultDocument: 'index.html');
  final appHandler = router.AppRoutes().handler;

  // set cors
  final overrideHeaders = {
    'ACCESS_CONTROL_ALLOW_ORIGIN': 'localhost',
    'Content-Type': 'application/json;charset=utf-8'
  };

  // set handler
  final cascadeHandler =
      Cascade().add(staticFileHandler).add(appHandler).handler;
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addHandler(cascadeHandler);

  // Create server
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await shelf_io.serve(handler, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
