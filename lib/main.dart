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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 200),
                const Text('Basic Buttons', style: TextStyle(fontSize: 30)),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    Button.basic(
                      text: 'Boton 1',
                      onTap: () {},
                      width: 200,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    Button.basic(
                      text: 'text',
                      onTap: () {},
                      width: 150,
                      backgroundColor: Colors.purple,
                      isEnabled: false,
                    ),
                    Button.basic(
                      text: 'Boton 3',
                      onTap: () {
                        print('Hola desde el botón 3');
                      },
                      width: 300,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      suffixIcon: Icons.check,
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                const Text('Error Buttons', style: TextStyle(fontSize: 30)),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    Button.error(
                      text: 'ERROR :(',
                      onTap: () {},
                      width: 300,
                      // isEnabled: false,
                    ),
                    Button.error(
                      text: 'Error!',
                      onTap: () {},
                      width: 150,
                      isEnabled: false,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
