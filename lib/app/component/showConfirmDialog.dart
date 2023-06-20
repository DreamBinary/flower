import 'package:animations/animations.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flutter/material.dart';

Future<dynamic> showConfirmModal(BuildContext context,
    {required String title,
    required String content,
    required Function onConfirmTap}) {
  return showModal(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: const Text(AppString.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(AppString.confirm),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirmTap();
            },
          ),
        ],
      );
    },
  );
}
