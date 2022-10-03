import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/helpers/validation_helper.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {

  static const String routeName = 'login';
   
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
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30),

                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                )
              ),

              const SizedBox(height: 50),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, RegisterScreen.routeName),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder())
                ),
                child: const Text(
                    'Crear una nueva cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.black87)
                  )
                ),
              const SizedBox(height: 50),

            ],
          ),
        ),
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [

          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'jhon.doe@mail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.alternate_email_sharp
            ),
            initialValue: loginForm.email,
            onChanged: (value) => loginForm.email= value,
            validator: (value) => ValidationHelper.isEmail(value, 'El valor ingresado no luce como un correo'),
          ),

          const SizedBox(height: 30),

          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*****',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock
            ),
            initialValue: loginForm.password,
            onChanged: (value) => loginForm.password= value,
            validator: (value) => ValidationHelper.isValidPassword(value, 'La contraseña debe de ser de al menos 6 caracteres'),

          ),

          const SizedBox(height: 50),

          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: loginForm.isLoading ? null : () async {
              FocusScope.of(context).unfocus();

              if (!loginForm.isValidForm()) return;

              loginForm.isLoading = true;

              final authService = Provider.of<AuthService>(context, listen: false);
              final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

              if (errorMessage == null) {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              } else {
                loginForm.isLoading = false;
                print(errorMessage);
                NotificationService.showSnackBar(errorMessage);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Espere...' : 'ingresar',
                style: const TextStyle(color: Colors.white)
              ),
            ),
          ),

          const SizedBox(height: 50),
        ],
      )
    );
  }
}