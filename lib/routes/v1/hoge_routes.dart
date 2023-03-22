import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:dartserver/controllers/hoge_controller.dart'
    show HogeController;

class HogeRoutes {
  Router get router {
    final hogeController = HogeController();
    final router = Router();

    router.get('/hoge', hogeController.getAllHoge);

    router.all(
        '/<ignored|.*>', (Request request) => Response.notFound('Not Found'));
    return router;
  }
}
