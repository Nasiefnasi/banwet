import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import '../Style/const.dart';

class CustomSerchField extends StatelessWidget {
  CustomSerchField(
      {super.key,
      required this.controller,
      this.validator,
      required this.suggestions,
      required this.label,
      var dyy,
      required this.iconss,
      this.colors});
  final TextEditingController controller;
  final colors;
  String? Function(String?)? validator;
  final Widget iconss;
  List<SearchFieldListItem<dynamic>> suggestions;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SearchField(
      itemHeight: 40,
      searchStyle: header11,
      suggestionItemDecoration: BoxDecoration(
        color: bColor2,
      ),
      suggestionStyle: header11.copyWith(color: Colors.black54, fontSize: 12),
      controller: controller,
      validator: validator,
      searchInputDecoration: InputDecoration(
        labelText: label,
        labelStyle: header11.copyWith(color: Colors.black54, fontSize: 12),
        suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        icon: iconss,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors ?? Colors.black26, width: 1),
        ),
      ),
      suggestions: suggestions,
    );
  }
}
