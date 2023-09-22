part of com.rick_and_morty.app.dashboard.ui.widgets;

class SearchCharacterBuilder extends StatelessWidget {
  const SearchCharacterBuilder({
    required this.controller,
    required this.onClose,
    super.key,
  });
  final SearchController controller;
  final void Function() onClose;

  @override
  Widget build(BuildContext context) => SearchBar(
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        hintText: 'Buscar personaje',
        hintStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(color: Colors.gray[0]),
        ),
        onChanged: (_) {
          controller.openView();
        },
        onTap: controller.openView,
        backgroundColor: MaterialStatePropertyAll<Color>(
          Colors.black[800]!,
        ),
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(color: Colors.gray[0]),
        ),
        leading: Icon(
          Icons.search,
          color: Colors.gray[0],
        ),
        trailing: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.gray[0],
            ),
            onPressed: onClose,
          ),
        ],
      );
}
