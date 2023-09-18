part of com.rick_and_morty.app.dashboard.ui.widgets;

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            children: [
              const CircleAvatar(
                radius: 100,
                child: Text('YH'),
              ),
              Spacing.spacingV16,
              Text(
                'Benet Sanchez',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Spacing.spacingV4,
              Text(
                'HUMAN',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.gray[0],
                    ),
              ),
              Spacing.spacingV16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(
                    text: 'text',
                    color: Colors.red[400],
                    icon: Icons.edit,
                  ),
                  Spacing.spacingH12,
                  Badge(
                    text: 'text',
                    color: Colors.red[400],
                    icon: Icons.edit,
                  ),
                ],
              ),
              Spacing.spacingV32,
              Button(
                type: ButtonType.secondary,
                text: 'Ver perfil',
                onPressed: () {},
                icon: Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
