part of com.rick_and_morty.app.dashboard.ui.views;

class DetailCharacterView extends ConsumerStatefulWidget {
  const DetailCharacterView({
    required this.character,
    super.key,
  });

  final Character character;

  static const String routeName = 'detail-character';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailCharacterViewState();
}

class _DetailCharacterViewState extends ConsumerState<DetailCharacterView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModel);

    List<Character> characters = (state.characters ?? <Character>[])
        .where((Character element) => element.id != widget.character.id)
        .toList();

    return Scaffold(
      key: const Key('detail_character_view_key'),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white[0],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.only(
          top: 40,
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.network(widget.character.image!),
                  ),
                ),
                Badge(
                  text: widget.character.id.toString(),
                  color: Gradients.main.colors.first,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 8,
                  ),
                  labelStyle:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Gradients.main.colors.first,
                          ),
                ),
              ],
            ),
            Spacing.spacingV16,
            Text(
              widget.character.name!,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Spacing.spacingV8,
            Text(
              'Species',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.gray[0],
                  ),
            ),
            Spacing.spacingV12,
            Text(
              widget.character.species!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacing.spacingV8,
            Text(
              'Creaed',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.gray[0],
                  ),
            ),
            Spacing.spacingV12,
            Text(
              widget.character.created!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Spacing.spacingV8,
            Wrap(
              children: <Widget>[
                Badge(
                  text: widget.character.location!.name!,
                  color: Colors.pink[400],
                  icon: Icons.room,
                ),
                Spacing.spacingH12,
                Badge(
                  text: widget.character.status!.value!,
                  color: widget.character.status!.isDead
                      ? Colors.red[400]
                      : Colors.green[500],
                  icon: Icons.heart_broken,
                ),
              ],
            ),
            Spacing.spacingV64,
            Spacing.spacingV8,
            Text(
              'Más personajes',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.gray[0],
                  ),
            ),
            Spacing.spacingV16,
            SizedBox(
              height: 500,
              child: CharacterList(
                key: const Key('character_list_key'),
                items: characters,
                scrollDirection: Axis.horizontal,
                onTap: (Character _character) {
                  ref
                      .read(homeViewModel.notifier)
                      .navigateToDetailCharacterView(
                        context,
                        _character,
                      );
                  controller.jumpTo(0);
                },
              ),
            ),
            Spacing.spacingV16,
          ],
        ),
      ),
    );
  }
}
