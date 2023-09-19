library com.rick_and_morty.app.utilities.form;

String? validateEmail(String email) {
  bool validEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);

  if (email.isEmpty) {
    return 'Ingresa un email válido.';
  } else if (!validEmail) {
    return 'Escribe un email válido.';
  }
  return null;
}

String? checkRequiredField(String value) {
  if (value.isEmpty) {
    return 'Este campo es requerido.';
  }
  return null;
}
