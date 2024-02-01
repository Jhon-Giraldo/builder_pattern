import 'package:flutter/material.dart';

class ButtonWidgetBuilder extends StatelessWidget {
  final Key customKey;
  final String text;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isEnabled;
  final bool isHug;
  final double? width;
  final Icon? customSuffixIcon;
  final Color? backgroundColor;

  const ButtonWidgetBuilder(
      {super.key,
      required this.customKey,
      required this.text,
      required this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      required this.isEnabled,
      required this.isHug,
      this.width,
      this.customSuffixIcon,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: customKey,
      onTap: isEnabled ? onTap : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Container(
        width: width ?? (!isHug ? null : double.infinity),
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
          color: isEnabled ? backgroundColor : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: prefixIcon != null,
              child: Icon(
                prefixIcon,
                size: 24,
                color: isEnabled ? Colors.black : Colors.grey,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isEnabled ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: suffixIcon != null,
              child: Icon(
                suffixIcon,
                size: 24,
                color: isEnabled ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
