abstract class IApiService {
  Future<Map<String, dynamic>> postAsync({
    required Map<String, dynamic> body,
    required String url,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> putAsync({
    required Map<String, dynamic> body,
    required String url,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> getAsync({
    required String url,
    Map<String, String>? headers,
  });
}
