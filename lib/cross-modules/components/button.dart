part of com.rick_and_morty.components;

enum ButtonType { primary, secondary }

class Button extends StatelessWidget {
  const Button({
    required this.text,
    this.type = ButtonType.primary,
    this.onPressed,
    this.icon,
    super.key,
  });
  final String text;
  final ButtonType? type;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Widget button = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: Gradients.main,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed != null ? onPressed! : null,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: const Color.fromRGBO(12, 19, 79, 1),
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );

    if (type == ButtonType.secondary) {
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black[600],
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed != null ? onPressed! : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect bounds) => Gradients.main.createShader(
                bounds,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            if (icon != null) ...<Widget>[
              Spacing.spacingH8,
              Icon(
                icon,
                color: Gradients.main.colors.first,
                size: 16,
              ),
            ],
          ],
        ),
      );
    }
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) => SizedBox(
        width: constraints.maxWidth,
        child: button,
      ),
    );
  }
}
