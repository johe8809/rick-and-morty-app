part of com.rick_and_morty.core.api;

class RepositoryRest {
  RepositoryRest._();

  static final RepositoryRest instance = RepositoryRest._();
  static String? basePath;
  final Duration timeout = const Duration(seconds: 30);
  static const Map<String, String> basicHeader = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<Response?> request({
    required String path,
    required HttpMethod? method,
    Uri? uri,
    Object? requestPayload,
    Map<String, String>? headers = basicHeader,
  }) async {
    Uri url = uri ?? Uri.parse(path);
    try {
      Response? response;
      switch (method!.value) {
        case 'GET':
          response = await _get(
            url,
            headers: headers,
          );
          break;

        default:
          throw UnimplementedError();
      }

      if (response != null && response.statusCode >= 400) {
        throw Exception(
          'exception response != null && response.statusCode >= 400',
        );
      }
      return response;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Response?> _get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    try {
      return await get(url);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
