import 'package:flutter/material.dart';
import 'package:flutter_patron_builder/widgets/buttons/variants/basic_button.dart';
import 'package:flutter_patron_builder/widgets/buttons/variants/error_button.dart';

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
    Color? backgroundColor,
    Color? textColor,
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
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }

  factory Button.error({
    required String text,
    required VoidCallback onTap,
    bool isEnabled = true,
    bool isHug = false,
    double? width,
  }) {
    return Button(
      data: ButtonModel(
        text: text,
        type: 'error',
        onTap: onTap,
        isEnabled: isEnabled,
        isHug: isHug,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String type = data.type;

    final Map<String, Widget> buttonsVariants = {
      'basic': BasicButton(
        text: data.text,
        onTap: data.onTap,
        isEnabled: data.isEnabled,
        width: data.width,
        isHug: data.isHug,
        backgroundColor: data.backgroundColor,
        textColor: data.textColor,
        prefixIcon: data.prefixIcon,
        suffixIcon: data.suffixIcon,
      ),
      'error': ErrorButton(
        text: data.text,
        onTap: data.onTap,
        isEnabled: data.isEnabled,
        width: data.width,
        isHug: data.isHug,
      ),
    };

    return buttonsVariants[type]!;
  }
}
