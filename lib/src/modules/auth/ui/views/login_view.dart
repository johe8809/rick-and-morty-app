part of com.rick_and_morty.app.auth.ui.views;

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginState state = ref.watch(loginViewModel);

    return Scaffold(
      key: const Key('login_view_key'),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://pbs.twimg.com/media/Fl0IeEVX0AA2EF3.jpg',
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.57,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black[900],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 52,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hoola 🖖',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Spacing.spacingV16,
                        Input(
                          key: const Key('email_field_key'),
                          controller: _emailController,
                          label: 'Correo',
                          placeholder: 'ejemplo@correo.com',
                        ),
                        Spacing.spacingV32,
                        Input(
                          key: const Key('password_field_key'),
                          controller: _passwordController,
                          label: 'Contraseña',
                          placeholder: '*********',
                          obscureText: true,
                        ),
                        if (state.error != null) ...<Widget>[
                          Spacing.spacingV16,
                          Text(
                            key: const Key('login_error_text_key'),
                            state.error!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.red[400],
                                ),
                          ),
                        ],
                        Spacing.spacingV48,
                        Button(
                          key: const Key('login_button_key'),
                          text: 'Ingresar',
                          onPressed: () {
                            ref.read(loginViewModel.notifier).login(
                                  context,
                                  _emailController!.text,
                                  _passwordController!.text,
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
