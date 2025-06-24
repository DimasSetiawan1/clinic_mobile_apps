import 'package:flutter/material.dart';

Future<dynamic> showErrorPopup(
  BuildContext context, {
  required String title,
  required String message,
  Function()? callback,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: callback,
            child: const Text('Reload'),
          ),
        ],
      );
    },
  );
}