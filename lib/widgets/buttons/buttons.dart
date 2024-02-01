import 'package:flutter/material.dart';

import 'model/button_model.dart';

class Button extends StatelessWidget {
  final ButtonModel data;

  const Button({
    required this.data,
    Key? key,
  }) : super(key: key);

  factory Button.basic({
    required String text,
    required VoidCallback onTap,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isEnabled = true,
    bool isHug = false,
    double? width,
  }) {
    return Button(
      data: ButtonModel(
        text: text,
        type: 'basic',
        onTap: onTap,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isEnabled: isEnabled,
        isHug: isHug,
        width: width,
      ),
    );
  }

  factory Button.error({
    required String text,
    required VoidCallback onTap,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isEnabled = true,
    bool isHug = false,
    double? width,
  }) {
    return Button(
      data: ButtonModel(
        text: text,
        type: 'error',
        onTap: onTap,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isEnabled: isEnabled,
        isHug: isHug,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: data.isEnabled ? data.onTap : null,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Container(
        width: data.width ?? (!data.isHug ? null : double.infinity),
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
          color: data.isEnabled ? data.backgroundColor : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: data.prefixIcon != null,
              child: Icon(
                data.prefixIcon,
                size: 24,
                color: data.isEnabled ? Colors.black : Colors.grey,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  data.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: data.isEnabled ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: data.suffixIcon != null,
              child: Icon(
                data.suffixIcon,
                size: 24,
                color: data.isEnabled ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
