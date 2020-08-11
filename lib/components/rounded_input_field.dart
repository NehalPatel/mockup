import 'package:flutter/material.dart';
import '../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.textInputType = TextInputType.text,
    this.onChanged,
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
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
      ),
    );
  }
}
