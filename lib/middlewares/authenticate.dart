import 'package:shelf/shelf.dart';

Middleware authenticate({required String apiKey}) {
  return (Handler handler) {
    return (Request request) async {
      // リクエストヘッダーから APIキー を取得する
      final apiKeyHeader = request.headers['X-Api-Key'];

      // APIキーが正しいかチェックする
      if (apiKeyHeader == apiKey) {
        // APIキーが正しい場合は、ハンドラーを呼び出してレスポンスを返す
        return await handler(request);
      } else {
        // APIキーが正しくない場合は、401エラーを返す
        return Response.forbidden('Invalid API Key');
      }
    };
  };
}
