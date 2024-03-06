import 'package:flutter/material.dart';

class TextEditWidget extends StatefulWidget {
  const TextEditWidget(
      {super.key,
      required this.onChanged,
      required this.labelText,
      required this.errorText});

  final Function(String) onChanged;
  final String labelText;
  final String errorText;

  @override
  State<TextEditWidget> createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  TextEditingController controller = TextEditingController();
  bool showError = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'Epilogue',
          fontWeight: FontWeight.w500,
          height: 0.06,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorText: showError ? widget.errorText : null,
        filled: true,
        fillColor: const Color(0xFFfafafa),
      ),
    );
  }
}
