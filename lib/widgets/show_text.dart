import 'package:flutter/material.dart';
import 'package:wittravel/utility/my_constant.dart';

class showText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  const showText({Key? key, required this.title, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle == null ? MyConstant().h3style() :textStyle! ,
    );
  }
}

