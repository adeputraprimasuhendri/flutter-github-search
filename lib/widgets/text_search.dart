import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  final controller;
  final action;
  final validator;

  const TextSearch({Key key, this.controller, this.action, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: action,
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search Github User',
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF1A714B),
          ),
        ),
      ),
    );
  }
}
