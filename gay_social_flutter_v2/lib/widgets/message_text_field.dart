import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.send,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Send a message',
          ),
        ),
      ),
    );
  }
}
