part of com.rick_and_morty.components;

class Input extends StatelessWidget {
  const Input({
    this.label,
    this.placeholder,
    this.errorText,
    super.key,
  });

  final String? label;
  final String? placeholder;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!),
        Spacing.spacingV4,
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            filled: true,
            fillColor: Colors.black[600],
            hintText: placeholder != null ? placeholder! : null,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.gray[0],
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Gradients
                    .main.colors.first, // TODO(Yonnathan): add gradient
              ),
            ),
            errorText: errorText != null ? errorText! : null,
            errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.red[400],
                ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.red[400]!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.red[400]!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
