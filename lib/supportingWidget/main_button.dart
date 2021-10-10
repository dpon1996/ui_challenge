
import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool loading;
  final Color color;
  final Color titleColor;
  final Color loadingColor;
  final double radius;
  final double elevation;
  final double height;
  final double? width;
  final Color borderColor;
  final double titleSize;
  final VisualDensity? visualDensity;
  final Widget? child;

  const MainButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.color = Colors.blue,
    this.titleColor = Colors.white,
    this.loadingColor = Colors.white,
    this.radius = 5,
    this.elevation = 0,
    this.height = 55,
    this.width = double.infinity,
    this.borderColor = Colors.transparent,
    this.titleSize = 17,
    this.visualDensity,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: onTap,
      color: color,
      height: height,
      elevation: elevation,
      minWidth: width,
      visualDensity: visualDensity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: borderColor)),
      child: loading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
              ),
            )
          : child != null
              ? child!
              : Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .9,
                    fontSize: titleSize,
                  ),
                ),
    );
  }
}
