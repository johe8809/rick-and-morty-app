part of com.rick_and_morty.app.auth.ui.views;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Image.network(
                'https://pbs.twimg.com/media/Fl0IeEVX0AA2EF3.jpg',
                height: MediaQuery.of(context).size.height,
                // fit: BoxFit.cover,
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
                          const Input(
                            label: 'Correo',
                            placeholder: 'ejemplo@correo.com',
                          ),
                          Spacing.spacingV32,
                          const Input(
                            label: 'Contraseña',
                            placeholder: '*********',
                          ),
                          Spacing.spacingV48,
                          const Button(
                            text: 'Ingresar',
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
