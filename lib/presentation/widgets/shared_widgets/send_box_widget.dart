import 'package:flutter/material.dart';

class SendBoxWidget extends StatelessWidget {
  const SendBoxWidget({Key? key, required this.onValue}) : super(key: key);

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final focus = FocusNode();

    final textController = TextEditingController();

    final border = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final borderActive = OutlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40));

    final decoration = InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: borderActive,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
          },
        ));

    return SizedBox(
      height: 45,
      child: TextFormField(
        //cursorHeight: 20,
        controller: textController,
        focusNode: focus,
        decoration: decoration,
        onTapOutside: (event) {
          focus.unfocus();
        },
        onFieldSubmitted: (value) {
          textController.clear();
          focus.requestFocus();
          onValue(value);
        },
      ),
    );
  }
}
