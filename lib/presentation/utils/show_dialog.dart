import 'package:flutter/material.dart';

class ShowDialogUtil extends StatelessWidget {
  final String title;
  final String content;
  final bool activeactionButton;
  final Function? onTap;
  const ShowDialogUtil(
      {required this.title,
      required this.content,
      required this.activeactionButton,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('Back'))
      ],
    );
  }
}
