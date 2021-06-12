import 'package:flutter/material.dart';

Widget myTextInput({
  String? label,
  required TextEditingController controller,
  Function? validator,
  Function? sufPressed,
  bool outLineBorder = true,
  required TextInputType type,
  Widget? preIcon,
  IconData? sufIcon,
  bool hideText = false,
}) {
  return TextFormField(
    validator: validator!(),
    controller: controller,
    obscureText: hideText,
    decoration: InputDecoration(
      border: outLineBorder ? OutlineInputBorder() : UnderlineInputBorder(),
      labelText: label,
      prefixIcon: preIcon,
      suffixIcon: IconButton(
        icon: Icon(sufIcon),
        onPressed: sufPressed!(),
      ),
    ),
    keyboardType: type,
  );
}
