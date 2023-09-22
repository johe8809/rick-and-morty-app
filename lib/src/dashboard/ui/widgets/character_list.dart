part of com.rick_and_morty.app.dashboard.ui.widgets;

class CharacterList extends StatelessWidget {
  const CharacterList({
    required this.items,
    this.onTap,
    this.scrollDirection,
    super.key,
  });

  final List<Character> items;
  final void Function(Character character)? onTap;
  final Axis? scrollDirection;

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemBuilder: (BuildContext context, int index) => CharacterCard(
          character: items[index],
          onTap: (Character character) {
            onTap!(character);
          },
        ),
        separatorBuilder: (BuildContext context, int index) =>
            scrollDirection == Axis.horizontal
                ? Spacing.spacingH16
                : Spacing.spacingV16,
      );
}
