// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/const.dart';

class PasswordTextfield extends StatelessWidget {
  PasswordTextfield(
      {Key? key,
      // required this.controller,
      required this.obscureFunction,
      required this.hintText,
      required this.keybord,
      required this.controls,
      // required this.label,
      this.validator,
      required this.obscureText})
      : super(key: key);
  final TextEditingController controls;
  final RxBool obscureText;
  final TextInputType keybord;
  void Function() obscureFunction;
  // final LoginController controller;
  final String hintText;
  // final String label;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
        enableInteractiveSelection: true,
        //  keyboardType: TextInputType.p,
        controller: controls,
        obscureText: obscureText.value,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: header10.copyWith(
              color: Colors.black54, fontFamily: regular, fontSize: 16),
          prefixIcon: const Icon(
            Icons.password,
            color: Color.fromARGB(255, 165, 165, 165),
            size: 20,
          ),
          // hintText: hintText,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
          suffixIcon: IconButton(
              onPressed: () {
                // obscureFunction();
                obscureText.value = !obscureText.value;
              },
              icon: obscureText.value
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      size: 20,
                      color: Color.fromARGB(255, 165, 165, 165),
                    )
                  : const Icon(
                      Icons.visibility_outlined,
                      size: 20,
                      color: Color.fromARGB(255, 165, 165, 165),
                    )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 211, 211, 211), width: 1.0)),
          //   border: InputBorder.none,
        ),
        validator: validator));
  }
}
