import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:dartserver/middlewares/authenticate.dart' show authenticate;
import 'package:dartserver/routes/v1/echo_routes.dart' show EchoRoutes;
import 'package:dartserver/routes/v1/hoge_routes.dart' show HogeRoutes;

class AppRoutes {
  Handler get handler {
    final router = Router();

    //router.mount('/api/v1/echo', EchoRoutes().router);
    router.mount('/api/v1/echo', Pipeline().addHandler(EchoRoutes().router));
    router.mount(
        '/api/v1/hoge',
        Pipeline()
            .addMiddleware(authenticate(apiKey: 'my_secret_api_key'))
            .addHandler(HogeRoutes().router));

    router.all(
        '/<ignored|.*>', (Request request) => Response.notFound('Not Found'));
    return router;
  }
}
