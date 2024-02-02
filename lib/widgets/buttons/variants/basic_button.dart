import 'package:flutter/material.dart';
import 'package:flutter_patron_builder/widgets/buttons/button_builder.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isEnabled;
  final bool isHug;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const BasicButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isEnabled,
    required this.isHug,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonWidgetBuilder.build(
      ButtonBuilder(
        key: const Key('basic-button'),
      )
          .setText(text)
          .setIsHug(isHug)
          .setWidth(width)
          .setIsEnabled(isEnabled)
          .setBackgroundColor(backgroundColor)
          .setTextColor(textColor)
          .setOnTap(onTap)
          .setPrefixIcon(prefixIcon)
          .setSuffixIcon(suffixIcon),
    );
  }
}
