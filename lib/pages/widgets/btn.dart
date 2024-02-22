import 'package:flutter/material.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';

class Btn extends StatelessWidget {
  final VoidCallback? func;
  final Color color;
  final String text;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  const Btn({
    super.key,
    this.func,
    this.color = cr_3c9,
    this.text = 'confirm',
    this.textColor = cr_fff,
    this.borderColor = Colors.black12,
    this.padding = const EdgeInsets.only(left: 15, right: 15, bottom: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: func,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
          ),
          child: TextFont(
            fontSize: 18,
            text: text,
            textAlign: TextAlign.center,
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
