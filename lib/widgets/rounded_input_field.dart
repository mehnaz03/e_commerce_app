import 'package:e_commerce_app/constans.dart';
import 'package:e_commerce_app/widgets/text_field_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
final String hintText;
final IconData icon;
final ValueChanged<String> onChanged;
final Function(String) onSubmitted;
final TextInputAction textInputAction;
const RoundedInputField({
Key key,
  this.hintText,
  this.icon = Icons.person,
  this.onChanged,
  this.onSubmitted,
  this.textInputAction
}) : super(key: key);

@override
Widget build(BuildContext context) {
  return TextFieldContainer(
    child: TextField(
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
}
