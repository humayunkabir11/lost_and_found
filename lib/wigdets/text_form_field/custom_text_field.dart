import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    this.isPassword,
    this.isPrefixIcon,
    this.showCursor,
    this.obSecured,
    this.onChanged,
    this.textEditingController,
    this.keyboardType,
    this.textStyle, this.isFilled,
    this.cursorColor,
    this.prefixIconColor,
    this.filledColor,
    this.cursorHeight,
    this.cursorWidth,
    this.icon,
    this.outlineInputBorder,
    this.inputDecoration,
    this.hintText,


  });


  final bool ?isPassword;
  final bool ?isPrefixIcon;
  final bool ?showCursor;
  final bool ?obSecured;
  final bool ?isFilled;
  final Color ?cursorColor;
  final Color ?prefixIconColor;
  final Color ?filledColor;
  final double? cursorHeight;
  final int?cursorWidth;
  final IconData ?icon;


  final void Function(String)? onChanged;
  final TextEditingController ?textEditingController;
  final OutlineInputBorder ? outlineInputBorder;
  final InputDecoration ? inputDecoration;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final String ? hintText;




  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'please give right input';
        }
      },
      style: const TextStyle(),
      controller: textEditingController,
      keyboardType: keyboardType,

      cursorColor: cursorColor,
      showCursor: true,
      cursorHeight: cursorHeight,
      cursorWidth: 5,

      decoration: InputDecoration(
        filled: true,
        fillColor:filledColor,
        // focusColor: Colors.red,
        prefixIcon: Icon(icon),
        prefixIconColor: prefixIconColor,
        hintText: hintText,
        hintStyle: TextStyle(),

        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.grey),
        ),

        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.red),
        ),

      ),
    );
  }
}
