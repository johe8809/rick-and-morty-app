part of com.rick_and_morty.typing.enum_types;

enum HttpMethod {
  GET('GET'),
  POST('POST'),
  PUT('PUT'),
  PATCH('PATCH'),
  DELETE('DELETE'),
  FILE('FILE'),
  MULTIPART('MULTIPART'),
  MESURA('MESURA'),
  DATAMESURA('DATAMESURA');

  const HttpMethod(String method) : value = method;
  final String value;
}
