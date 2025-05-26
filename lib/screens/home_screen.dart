import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Container(
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.clear,
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              margin: EdgeInsets.only(bottom: 50),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.matrix([
                    -1, 0, 0, 0, 255, // Red
                    0, -1, 0, 0, 255, // Green
                    0, 0, -1, 0, 255, // Blue
                    0, 0, 0, 1, 0, // Alpha
                  ]),
                  child: Image.asset(
                    "assets/images/a1.png",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: myController,
              style: TextStyle(color: Colors.black, fontSize: 26),
              decoration: InputDecoration(
                hintText: 'Insira o User',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                label: SizedBox(
                  height: 50,
                  child: Image.asset(
                    'assets/images/a2.png',
                  ),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.black),
              foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
            ),
            onPressed: () async {
              // ignore: avoid_print
              print(myController.value.text);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          ResultScreen(username: myController.value.text.replaceAll('_', '-')),
                ),
              ).then((_) {
                myController.clear();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('BUSCAR', style: TextStyle(fontSize: 26)),
            ),
          ),
        ],
      ),
    );
  }
}
