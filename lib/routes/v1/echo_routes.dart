import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart' show Router;
import 'package:dartserver/controllers/echo_controller.dart'
    show EchoController;

class EchoRoutes {
  final echoController = EchoController();

  Router get router {
    final router = Router();

    router.get('/message', echoController.getAllMessage);
    router.get('/messages', echoController.getMessages);
    router.post('/message', echoController.addMessage);
    router.put('/message', echoController.updateMessage);
    router.delete('/message', echoController.deleteMessage);

    router.all(
        '/<ignored|.*>', (Request request) => Response.notFound('Not Found'));
    return router;
  }
}
