import 'package:flutter/material.dart';

class ButtonBuilder {
  ButtonBuilder({
    required this.key,
  });

  Key key;
  String text = '';
  VoidCallback onTap = () {};
  IconData? prefixIcon;
  IconData? suffixIcon;
  Icon? customSuffixIcon;
  bool isEnabled = true;
  bool isHug = true;
  double? width;
  Color? backgroundColor = Colors.white;
  Color? textColor = Colors.black;

  ButtonBuilder setText(String value) {
    text = value;
    return this;
  }

  ButtonBuilder setTextColor(Color? value) {
    textColor = value;
    return this;
  }

  ButtonBuilder setOnTap(VoidCallback callback) {
    onTap = callback;
    return this;
  }

  ButtonBuilder setPrefixIcon(IconData? value) {
    prefixIcon = value;
    return this;
  }

  ButtonBuilder setSuffixIcon(IconData? value) {
    suffixIcon = value;
    return this;
  }

  ButtonBuilder setCustomSuffixIcon(Icon? value) {
    customSuffixIcon = value;
    return this;
  }

  ButtonBuilder setIsEnabled(bool value) {
    isEnabled = value;
    return this;
  }

  ButtonBuilder setIsHug(bool value) {
    isHug = value;
    return this;
  }

  ButtonBuilder setWidth(double? value) {
    width = value;
    return this;
  }

  ButtonBuilder setBackgroundColor(Color? value) {
    backgroundColor = value;
    return this;
  }

  ButtonWidgetBuilder build() {
    return ButtonWidgetBuilder._builder(this);
  }
}

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
  final Color? textColor;

  ButtonWidgetBuilder._builder(ButtonBuilder builder)
      : customKey = builder.key,
        text = builder.text,
        onTap = builder.onTap,
        prefixIcon = builder.prefixIcon,
        suffixIcon = builder.suffixIcon,
        customSuffixIcon = builder.customSuffixIcon,
        isEnabled = builder.isEnabled,
        isHug = builder.isHug,
        backgroundColor = builder.backgroundColor,
        textColor = builder.textColor,
        width = builder.width;

  factory ButtonWidgetBuilder.build(ButtonBuilder builder) {
    return ButtonWidgetBuilder._builder(builder);
  }

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
          color:
              isEnabled ? backgroundColor : backgroundColor?.withOpacity(0.5),
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
                    color: isEnabled ? textColor : textColor?.withOpacity(0.5),
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
