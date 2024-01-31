import 'package:flutter/material.dart';
import 'package:flutter_patron_builder/widgets/buttons/buttons.dart';

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
        body: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              Button.basic(
                text: 'Boton 1',
                onTap: () {},
                width: 200,
              ),
              Button.basic(
                text: 'text',
                onTap: () {},
                width: 300,
                isEnabled: false,
              ),
              Button.basic(
                text: 'text',
                onTap: () {},
                width: 150,
              ),
              Button.basic(
                text: 'text',
                onTap: () {},
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
