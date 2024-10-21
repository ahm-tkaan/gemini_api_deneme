import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final String label;
  TextStyle? labelStyle;
  TextEditingController controller;
  TextFieldComponent({
    Key? key,
    required this.label,
    this.labelStyle,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.greenAccent[100],
          suffixIcon: IconButton(
            onPressed: () => widget.controller.clear(),
            icon: const Icon(Icons.clear,size: 20,),

          ),

          labelText: widget.label,
          labelStyle: widget.labelStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),

          ),
        ),
      ),
    );
  }
}