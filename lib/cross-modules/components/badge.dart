part of com.rick_and_morty.components;

class Badge extends StatelessWidget {
  const Badge({
    required this.text,
    this.icon,
    this.color,
    this.padding,
    this.labelStyle,
    super.key,
  });
  final String text;
  final IconData? icon;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) => Chip(
        avatar: icon != null
            ? Icon(
                icon,
                color: color,
              )
            : null,
        backgroundColor: Colors.black[900],
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
        label: Text(text),
        labelStyle: labelStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color ?? Colors.white[0],
                ),
        side: BorderSide(
          color: color ?? Colors.white[0]!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}
