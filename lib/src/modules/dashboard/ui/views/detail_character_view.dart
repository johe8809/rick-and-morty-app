part of com.rick_and_morty.app.dashboard.ui.views;

class DetailCharacterView extends ConsumerStatefulWidget {
  const DetailCharacterView({super.key});

  static const String routeName = '/detail-character';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailCharacterViewState();
}

class _DetailCharacterViewState extends ConsumerState<DetailCharacterView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white[0],
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Detail Character View'),
            ],
          ),
        ),
      );
}
