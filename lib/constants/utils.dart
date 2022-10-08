import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants/global_variables.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: GlobalVariables.secondaryColor,
    ),
  );
}

// class SnackbarGlobal {
//   static GlobalKey<ScaffoldMessengerState> key =
//       GlobalKey<ScaffoldMessengerState>();

//   static void showSnackBar(BuildContext context, String text) {
//     key.currentState?.showSnackBar(SnackBar(content: Text(text)));
//   }
// }

// class AlertDialogWidget extends StatelessWidget {
//   final String text;
//   final BuildContext context;
//   const AlertDialogWidget({Key? key, required this.text, required this.context})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Text(text),
//       actions: [
//         FlatButton(
//           child: Text("حسنا"),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
