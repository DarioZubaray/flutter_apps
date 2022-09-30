import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool? isPassword;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: isPassword ?? false,
      autocorrect: false,

      onChanged: (value) {
        formValues[formProperty] = value;
      },

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ?'Hola mundo' : null;
      },

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,

        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        prefix: prefixIcon == null ? null : Icon(prefixIcon),
        icon: icon == null ? null :  Icon(icon),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.greenAccent)
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
        // )
      ),
    );
  }
}