import 'package:flutter/material.dart';

typedef VoidCallback = void Function();

class ZJCustomButton extends StatelessWidget {

  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus = false;
  final Clip clipBehavior = Clip.none;
  final Widget child;
  final RoundedRectangleBorder? roundedBorder;
  final EdgeInsets? padding;
  final double? elevation;

  const ZJCustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.roundedBorder,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: child,
        onPressed: onPressed,
        onLongPress: (){},
        clipBehavior: clipBehavior,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double?>(elevation),
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color?>(foregroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
            roundedBorder,
          ),
          padding: MaterialStateProperty.all<EdgeInsets?>(
            padding,
          ),
        ),
    );
  }
}
