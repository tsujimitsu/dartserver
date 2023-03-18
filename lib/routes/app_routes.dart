import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:dartwebserver/routes/v1/echo_routes.dart' show EchoRoutes;

class AppRoutes {
  Handler get handler {
    final router = Router();

    router.mount('/v1/echo', EchoRoutes().router);

    router.all(
        '/<ignored|.*>', (Request request) => Response.notFound('Not Found'));
    return router;
  }
}
