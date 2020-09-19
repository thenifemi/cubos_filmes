import 'package:cubos_desafio_Tecnico_flutter/presentation/utils/colors.dart';
import 'package:cubos_desafio_Tecnico_flutter/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSaved;
  final String labelText;
  final Widget prefix;

  const PrimaryTextField({
    Key key,
    @required this.controller,
    @required this.onSaved,
    @required this.labelText,
    @required this.prefix,
  }) : super(key: key);

  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: BorderSide.none,
    );

    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: BorderSide(
        color: MColors.dark,
        width: 1.0,
      ),
    );

    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      keyboardType: TextInputType.text,
      style: normalFont(MColors.textDark, 16.0),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefix,
        labelStyle: normalFont(null, 14.0),
        contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
        fillColor: MColors.gray,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        border: InputBorder.none,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
      ),
    );
  }
}
