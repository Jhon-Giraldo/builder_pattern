import 'package:flutter/material.dart';
import 'package:flutter_patron_builder/widgets/buttons/button_builder.dart';

class ErrorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isEnabled;
  final bool isHug;
  final double? width;

  const ErrorButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isEnabled,
    required this.isHug,
    this.width,
  }) : super(key: key);

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Ups hubo un error!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidgetBuilder.build(
      ButtonBuilder(
        key: const Key('error-button'),
      )
          .setText(text)
          .setIsHug(isHug)
          .setWidth(width)
          .setIsEnabled(isEnabled)
          .setBackgroundColor(Colors.redAccent)
          .setTextColor(Colors.black)
          // .setPrefixIcon(Icons.error)
          .setOnTap(() => showCustomSnackBar(context))
          .setSuffixIcon(Icons.error),
    );
  }
}
