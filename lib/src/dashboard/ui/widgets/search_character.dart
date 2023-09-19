part of com.rick_and_morty.app.dashboard.ui.views;

class SearchCharacter extends StatelessWidget {
  const SearchCharacter({
    required this.items,
    super.key,
  });

  final List<Character> items;

  @override
  Widget build(BuildContext context) => SearchAnchor(
        viewBackgroundColor: Colors.black[900],
        dividerColor: Colors.transparent,
        headerTextStyle: TextStyle(
          color: Colors.gray[0],
        ),
        builder: (BuildContext context, SearchController controller) =>
            SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16),
          ),
          hintText: 'Buscar personaje',
          hintStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(color: Colors.gray[0]),
          ),
          onTap: () {
            controller.openView();
          },
          backgroundColor: MaterialStatePropertyAll<Color>(
            Colors.black[900]!,
          ),
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(color: Colors.gray[0]),
          ),
          leading: Icon(
            Icons.search,
            color: Colors.gray[0],
          ),
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
            onPressed: context.pop,
          ),
        ],
        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) {
          if (controller.text.isEmpty) {
            return <Widget>[
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
          return List<Widget>.generate(
            items.length,
            (int index) {
              Character item = items[index];

              return ListTile(
                title: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.network(item.image!),
                      ),
                    ),
                    Text(
                      item.name!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                onTap: () {
                  controller.closeView(item.name);
                },
              );
            },
          );
        },
      );
}
