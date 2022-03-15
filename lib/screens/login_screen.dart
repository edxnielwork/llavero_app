import 'package:flutter/material.dart';
import 'package:llavero_app/providers/login_form_provider.dart';
import 'package:llavero_app/widgets/ui/input_decorations.dart';
import 'package:llavero_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('LOGIN', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  //const Text('Formulario')

                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Crear una nueva cuenta',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      //Mantener las referencias
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: 'edxniel@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.person),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'No es un correo electrónico';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*********',
              labelText: 'Contrasea',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'No cumple el formato';
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: const Color.fromARGB(255, 25, 40, 177),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Conectandose...' : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                )),
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (!loginForm.isValidForm()) return;
              loginForm.isLoading = true;
              Future.delayed(const Duration(seconds: 5));
              //TODO: validar si el login es corecto
              loginForm.isLoading = false;

              Navigator.pushReplacementNamed(context, 'home');
            },
          )
        ],
      ),
    );
  }
}
