import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                prefixIcon: const Icon(Icons.chevron_right_rounded),
                border: OutlineInputBorder(),
                hintText: 'First Number',
                labelText: 'First Number',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: secondController,
              decoration: const InputDecoration(
                prefixIcon: const Icon(Icons.chevron_right_rounded),
                labelText: 'Second Number',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
                hintText: 'Second Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    performOperation((a, b) => a + b, '+');
                  },
                  child: const Text('+'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent), // เปลี่ยนสีพื้นหลังที่นี่
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    performOperation((a, b) => a - b, '-');
                  },
                  child: const Text('-'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent), // เปลี่ยนสีพื้นหลังที่นี่
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    performOperation((a, b) => a * b, '*');
                  },
                  child: const Text('*'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent), // เปลี่ยนสีพื้นหลังที่นี่
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    performOperation((a, b) {
                      if (b != 0) {
                        return a / b;
                      } else {
                        // Handle division by zero case
                        return double.infinity;
                      }
                    }, '/');
                  },
                  child: const Text('/'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent), // เปลี่ยนสีพื้นหลังที่นี่
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Result: $result',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void performOperation(
      double Function(double, double) operation, String symbol) {
    if (firstController.text.isNotEmpty && secondController.text.isNotEmpty) {
      double a = double.parse(firstController.text);
      double b = double.parse(secondController.text);
      setState(() {
        result = operation(a, b);
      });
    }
  }
}
