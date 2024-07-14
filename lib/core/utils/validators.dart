// email validator

emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Correo es requerido';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Correo no válido';
  }

  return null;
}

passwordValidator(String? value) {
  if (value!.isEmpty) {
    return 'Contraseña es requerida';
  }
  if (value.length < 6) {
    return 'Contraseña debe tener al menos 6 caracteres';
  }

  return null;
}

nameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Nombre es requerido';
  }

  return null;
}

phoneValidator(String? value) {
  if (value!.isEmpty) {
    return 'Teléfono es requerido';
  }
  if (value.length < 6) {
    return 'Teléfono debe tener al menos 6 caracteres';
  }
  // only numbers and + sign
  if (!RegExp(r'^[0-9+]*$').hasMatch(value)) {
    return 'Teléfono no válido';
  }

  return null;
}
