import 'package:flutter/material.dart';
import 'package:llavero_app/widgets/ui/input_decorations.dart';
import 'package:llavero_app/widgets/widgets.dart';

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
                  _LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //Mantener las referencias
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'edxniel@gmail.com',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icons.person),
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
