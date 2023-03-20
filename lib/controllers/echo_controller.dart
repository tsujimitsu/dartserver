import 'package:shelf/shelf.dart';
import 'package:dartserver/models/echo_model.dart';

class EchoController {
  Future<Response> getAllMessage(Request request) async {
    final echoModel = Echo(message: "");
    final results = echoModel.getAllEchos();
    final body = results.map((row) => row.message).toList();
    return Response.ok('["getMessage": $body]');
  }

  Future<Response> getMessages(Request request) async {
    return Response.ok('["getMessages"]');
  }

  Future<Response> addMessage(Request request) async {
    final echoModel = Echo(message: 'test1');
    echoModel.addEcho('test message');
    return Response.ok('["added"]');
  }

  Future<Response> updateMessage(Request request) async {
    return Response.ok('["update"]');
  }

  Future<Response> deleteMessage(Request request) async {
    return Response.ok('["delete"]');
  }
}
