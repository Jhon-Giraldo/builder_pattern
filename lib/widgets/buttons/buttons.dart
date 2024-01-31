import 'package:flutter/material.dart';
import 'package:flutter_patron_builder/widgets/buttons/variants/basic_button.dart';

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

  factory Button.modal({
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
        type: 'modal',
        onTap: onTap,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isEnabled: isEnabled,
        isHug: isHug,
        width: width,
      ),
    );
  }

  factory Button.filter({
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
        type: 'filter',
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
    final String type = data.type;

    final Map<String, Widget> buttonsVariants = {
      'basic': BasicButton(
        text: data.text,
        onTap: data.onTap,
        isEnabled: data.isEnabled,
        isHug: data.isHug,
      ),
      // 'modal': _buildModalButton(context),
      // 'filter': _buildFilterButton(context),
      // 'error': _buildErrorButton(context),
    };

    return buttonsVariants[type]!;

    // return InkWell(
    //   child: Container(),
    // );
  }
}
