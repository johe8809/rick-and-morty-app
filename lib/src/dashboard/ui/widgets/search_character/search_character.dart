part of com.rick_and_morty.app.dashboard.ui.widgets;

class SearchCharacter extends ConsumerStatefulWidget {
  const SearchCharacter({
    this.onSubmitted,
    super.key,
  });

  final void Function(Character? character)? onSubmitted;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchCharacterState();
}

class _SearchCharacterState extends ConsumerState<SearchCharacter> {
  void onSubmitted(Character? character) {
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(character);
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModel);

    return SearchAnchor(
      viewBackgroundColor: Colors.black[900],
      dividerColor: Colors.gray[0],
      headerTextStyle: TextStyle(
        color: Colors.gray[0],
      ),
      builder: (BuildContext context, SearchController controller) =>
          SearchCharacterBuilder(
        controller: controller,
        onClose: () {
          controller.text = '';
          onSubmitted(null);
          setState(() {});
        },
      ),
      viewLeading: Icon(
        Icons.search,
        color: Colors.gray[0],
      ),
      viewTrailing: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.gray[0],
          ),
          onPressed: () {
            onSubmitted(null);
            context.pop();
          },
        ),
      ],
      suggestionsBuilder: (
        BuildContext context,
        SearchController controller,
      ) {
        if (controller.text.isEmpty) {
          return <Widget>[
            Spacing.spacingV16,
            CircleAvatar(
              radius: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.network(
                  'https://www.augsburger-allgemeine.de/img/panorama/crop59858091/385098565-cv1_1-w1200/Sky-Ticket-Rick-and-Morty.jpg',
                ),
              ),
            ),
            Spacing.spacingV16,
            Text(
              'Escribe el nombre de un personaje para empezar a buscar',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.gray[0],
                  ),
              textAlign: TextAlign.center,
            ),
          ];
        }

        String searchValue = controller.text.toLowerCase();

        List<Character> data = state.characters!.where(
          (Character element) {
            String characterName = element.name!.toLowerCase();
            return characterName.contains(searchValue);
          },
        ).toList();

        return List<Widget>.generate(
          data.length,
          (int index) {
            Character item = data[index];

            return ListTile(
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(item.image!),
                    ),
                  ),
                  Spacing.spacingH16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Spacing.spacingH16,
                      Text(
                        item.species!.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.gray[0],
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                onSubmitted(item);
                controller.closeView(item.name);
              },
            );
          },
        );
      },
    );
  }
}
