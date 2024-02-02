import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 200),
                const Text('Unified Buttons', style: TextStyle(fontSize: 30)),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    const SizedBox(height: 200),
                    const Text('Basic Buttons', style: TextStyle(fontSize: 30)),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        UnifiedButton(
                          text: 'Boton 1',
                          onTap: () {
                            print('Hola desde el botón 1');
                          },
                          width: 200,
                          backgroundColor: Colors.blue,
                          textColor: Colors.white,
                          type: 'basic',
                        ),
                        UnifiedButton(
                          text: 'text',
                          onTap: () {},
                          width: 150,
                          backgroundColor: Colors.purple,
                          isEnabled: false,
                          type: 'basic',
                        ),
                        UnifiedButton(
                          text: 'Boton 3',
                          onTap: () {
                            print('Hola desde el botón 3');
                          },
                          width: 300,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          suffixIcon: Icons.check,
                          type: 'basic',
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    const Text('Error Buttons', style: TextStyle(fontSize: 30)),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        UnifiedButton(
                          text: 'ERROR :(',
                          onTap: () {},
                          width: 300,
                          type: 'error',
                        ),
                        UnifiedButton(
                          text: 'Error!',
                          onTap: () {},
                          width: 150,
                          isEnabled: false,
                          type: 'error',
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnifiedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isEnabled;
  final bool isHug;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final String type;

  const UnifiedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled = true,
    this.isHug = false,
    this.width,
    this.backgroundColor,
    this.textColor,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color finalBackgroundColor =
        backgroundColor ?? (type == 'error' ? Colors.redAccent : Colors.blue);
    Color finalTextColor = textColor ?? Colors.white;
    IconData? finalSuffixIcon = suffixIcon;
    IconData? finalPrefixIcon = prefixIcon;

    VoidCallback finalOnTap = isEnabled ? onTap : () {};

    if (type == 'error') {
      finalBackgroundColor = Colors.redAccent;
      finalTextColor = Colors.white;
      finalSuffixIcon = Icons.error_outline;
      finalOnTap = () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$text pressed'),
            backgroundColor: finalBackgroundColor,
          ),
        );
      };
    } else {
      finalBackgroundColor = backgroundColor ?? Colors.blue;
      finalTextColor = textColor ?? Colors.white;
    }

    return InkWell(
      onTap: finalOnTap,
      child: Container(
        width: width ?? (isHug ? double.infinity : null),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isEnabled
              ? finalBackgroundColor
              : finalBackgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (finalPrefixIcon != null)
              Icon(finalPrefixIcon,
                  color: isEnabled
                      ? finalTextColor
                      : finalTextColor.withOpacity(0.5)),
            if (finalPrefixIcon != null) const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: finalTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            if (finalSuffixIcon != null) const SizedBox(width: 8),
            if (finalSuffixIcon != null)
              Icon(
                finalSuffixIcon,
                color: isEnabled
                    ? finalTextColor
                    : finalTextColor.withOpacity(
                        0.5,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
