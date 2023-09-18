part of com.rick_and_morty.app.dashboard.ui.views;

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hoola 🖖',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Spacing.spacingV16,
                const CharacterCard(),
              ],
            ),
          ),
        ),
      );
}
