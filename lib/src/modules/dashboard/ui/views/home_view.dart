part of com.rick_and_morty.app.dashboard.ui.views;

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacing.spacingV16,
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacing.spacingV16,
              Input(
                errorText: 'Error',
              ),
              Spacing.spacingV16,
              Input(),
              Spacing.spacingV16,
              Badge(
                text: 'text',
                color: Colors.red[400],
                icon: Icons.edit,
              ),
              Spacing.spacingV16,
              CharacterCard(),
              Spacing.spacingV16,
              Button(
                text: 'Primary',
                onPressed: () {},
              ),
              Spacing.spacingV16,
              Button(
                type: ButtonType.secondary,
                text: 'Secondary',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
