part of com.rick_and_morty.app.dashboard.ui.views;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(homeViewModel.notifier).handleRetreiveCharacters(context);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModel);
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CharacterList(
            key: const Key('character_list_key'),
            items: state.characters ?? <Character>[],
            onTap: (Character character) {
              ref.read(homeViewModel.notifier).navigateToDetailCharacterView(
                    context,
                    character,
                  );
            },
          ),
        ),
      ),
    );
  }
}
