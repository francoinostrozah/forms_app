import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String passoword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChanged: (value) => username = value,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo Requiredo';
            if (value.trim().isEmpty) return 'Campo Requiredo';
            if (value.length < 6) return 'Más de 6 letras';
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Correo electrónico',
          onChanged: (value) => email = value,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo Requiredo';
            if (value.trim().isEmpty) return 'Campo Requiredo';

            final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );

            if (!emailRegExp.hasMatch(value)) {
              return 'No tiene formato de correo';
            }

            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          onChanged: (value) => passoword = value,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Campo Requiredo';
            if (value.trim().isEmpty) return 'Campo Requiredo';
            if (value.length < 6) return 'Más de 6 letras';
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            final isValid = _formKey.currentState!.validate();

            if (!isValid) return;

            print('$username, $email, $passoword');
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        )
      ]),
    );
  }
}
