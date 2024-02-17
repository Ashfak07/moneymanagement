import 'package:flutter/material.dart';

Future CustomAlertBox(BuildContext context, text) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('enter location'),
          content: TextFormField(
            controller: text,
          ),
          actions: [
            ElevatedButton(
              child: Text("save"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
