import 'package:shelf/shelf.dart';

class HogeController {
  Future<Response> getAllHoge(Request request) async {
    return Response.ok('["getMessage": "hogehoge"]');
  }
}
