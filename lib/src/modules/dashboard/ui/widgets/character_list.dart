part of com.rick_and_morty.app.dashboard.ui.widgets;

class CharacterList extends StatelessWidget {
  const CharacterList({
    required this.items,
    this.onTap,
    super.key,
  });

  final List<Character> items;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => CharacterCard(
          character: items[index],
          onTap: onTap,
        ),
        separatorBuilder: (BuildContext context, int index) =>
            Spacing.spacingV16,
      );
}
