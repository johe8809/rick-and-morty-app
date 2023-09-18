part of com.rick_and_morty.dashboard.core.services;

class DashboardService {
  DashboardService._();
  static final DashboardService instance = DashboardService._();

  Future<List<Character>> retreiveCharacters() async {
    try {
      Response? response = await RepositoryRest.instance.request(
        path: 'https://rickandmortyapi.com/api/character?page=1',
        method: HttpMethod.GET,
      );
      Map<String, dynamic> rawData =
          jsonDecode(response?.body ?? '') as Map<String, dynamic>;

      return (rawData['results'] as List<dynamic>)
          .map(
            (dynamic e) => Character.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    } on Exception catch (e) {
      return Future<List<Character>>.error(e);
    }
  }
}
