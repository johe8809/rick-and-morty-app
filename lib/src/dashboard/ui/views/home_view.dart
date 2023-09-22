part of com.rick_and_morty.app.dashboard.ui.views;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Character? characterSelected;

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Character>> characters = ref.watch(
      retreiveCharactersProvider,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: const Key('home_view_key'),
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                ref.read(homeViewModel.notifier).logout(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white[0],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: characters.when(
            data: (List<Character> data) => Column(
              children: <Widget>[
                SearchCharacter(
                  onSubmitted: (Character? character) {
                    characterSelected = character;
                    setState(() {});
                  },
                ),
                Spacing.spacingV16,
                if (characterSelected != null)
                  CharacterCard(
                    character: characterSelected!,
                    onTap: (Character character) {
                      ref
                          .read(homeViewModel.notifier)
                          .navigateToDetailCharacterView(
                            context,
                            character,
                          );
                    },
                  )
                else
                  CharacterList(
                    key: const Key('character_list_key'),
                    items: data,
                    onTap: (Character character) {
                      ref
                          .read(homeViewModel.notifier)
                          .navigateToDetailCharacterView(
                            context,
                            character,
                          );
                    },
                  ),
              ],
            ),
            loading: () => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white[0]!),
              ),
            ),
            error: (_, __) => const Center(
              child: Text('Ocurrió un error al cargar los datos'),
            ),
          ),
        ),
      ),
    );
  }
}
