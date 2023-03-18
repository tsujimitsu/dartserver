import 'package:shelf/shelf.dart';

class EchoController {
  Future<Response> getMessage(Request request) async {
    return Response.ok('["getMessage"]');
  }

  Future<Response> getMessages(Request request) async {
    return Response.ok('["getMessages"]');
  }

  Future<Response> postMessage(Request request) async {
    return Response.ok('["post"]');
  }

  Future<Response> updateMessage(Request request) async {
    return Response.ok('["update"]');
  }

  Future<Response> deleteMessage(Request request) async {
    return Response.ok('["delete"]');
  }
}
