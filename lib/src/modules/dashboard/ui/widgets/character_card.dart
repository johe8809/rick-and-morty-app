part of com.rick_and_morty.app.dashboard.ui.widgets;

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    this.onTap,
    super.key,
  });

  final Character character;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black[800],
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(character.image!),
                  ),
                ),
                Spacing.spacingV16,
                Text(
                  character.name!,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Spacing.spacingV4,
                Text(
                  character.species!.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.gray[0],
                      ),
                ),
                Spacing.spacingV16,
                Wrap(
                  children: <Widget>[
                    Badge(
                      text: character.location!.name!,
                      color: Colors.pink[400],
                      icon: Icons.room,
                    ),
                    Spacing.spacingH12,
                    Badge(
                      text: character.status!.value!,
                      color: character.status!.isDead
                          ? Colors.red[400]
                          : Colors.green[500],
                      icon: Icons.heart_broken,
                    ),
                  ],
                ),
                Spacing.spacingV32,
                Button(
                  type: ButtonType.secondary,
                  text: 'Ver perfil',
                  onPressed: () {
                    if (onTap != null) {
                      onTap!();
                    }
                  },
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      );
}
