import 'package:flutter/material.dart';

typedef OntapCallBack = void Function();

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.ontap,
      this.title = 'Ok',
      this.borderColor = Colors.transparent,
      this.bgColor,
      this.btnWidth = 70,
      this.btnHeight = 35,
      this.loading = false})
      : super(key: key);
  final OntapCallBack? ontap;
  final String title;
  final Color borderColor;
  final Color? bgColor;
  final double btnWidth;
  final double btnHeight;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: ontap ?? () {},
      child: Container(
        height: btnHeight,
        width: btnWidth,
        decoration: BoxDecoration(
          color: bgColor ?? theme.primaryColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: bgColor == Colors.transparent
                    ? theme.primaryColor
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}
