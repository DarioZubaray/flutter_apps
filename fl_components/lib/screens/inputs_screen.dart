import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {

  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myformKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      "first_name": '',
      "last_name": '',
      "nick_name": '',
      "email": '',
      "passsword": '',
      "role": 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myformKey,
            child: Column(
              children: [
          
                CustomInputField(
                  formProperty: 'first_name',
                  formValues: formValues,
                  labelText: 'Nombre',
                  hintText: 'nombre del usuario',
                  suffixIcon: Icons.admin_panel_settings,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
          
                CustomInputField(
                  formProperty: 'last_name',
                  formValues: formValues,
                  labelText: 'Apellido',
                  hintText: 'apellido del usuario',
                  icon: Icons.car_crash,
                ),
                const SizedBox(height: 20),
          
                CustomInputField(
                  formProperty: 'nick_name',
                  formValues: formValues,
                  labelText: 'Apodo',
                  hintText: 'apodo del usuario',
                  prefixIcon: Icons.join_full_outlined,
                ),
                const SizedBox(height: 20),
          
                CustomInputField(
                  formProperty: 'email',
                  formValues: formValues,
                  labelText: 'Email',
                  hintText: 'Email del usuario',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
          
                CustomInputField(
                  formProperty: 'passsword',
                  formValues: formValues,
                  labelText: 'Contraseña',
                  hintText: 'Password del usuario',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 30),

                DropdownButtonFormField(
                  value: 'user',
                  items: const [
                    DropdownMenuItem(value: 'user', child: Text('User')),
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'superuser', child: Text('Superuser')),
                    DropdownMenuItem(value: 'developer', child: Text('Developer')),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'user';
                  }
                ),
          
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if ( !myformKey.currentState!.validate() ) {
                      print('Formulario no valido');
                      return;
                    }

                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Guardar')
                    )
                  )
                )
          
              ]
            ),
          ),
        ),
      )
    );
  }
}

