import 'package:flutter/material.dart';
import 'package:wittravel/utility/my_constant.dart';
import 'package:wittravel/widgets/show_image.dart';
import 'package:wittravel/widgets/show_text.dart';

class MyDialog {
  Future<void> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(),
          title: showText(
            title: title,
            textStyle: MyConstant().h2style(),
          ),
          subtitle: showText(title: message),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
