part of com.rick_and_morty.dashboard.core.state;

AutoDisposeFutureProvider<List<Character>> retreiveCharactersProvider =
    FutureProvider.autoDispose<List<Character>>(
  (FutureProviderRef<List<Character>> ref) async {
    List<Character> data = await DashboardService.instance.retreiveCharacters();
    ref.read(homeViewModel.notifier).setCharacterList(data);
    return DashboardService.instance.retreiveCharacters();
  },
);
