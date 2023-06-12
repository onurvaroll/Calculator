import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String firstNumber = '0';
  String secondNumber = '0';
  String result = "";
  String text = "0";
  String operation = "";

  calculatorFunction(String icon) {
    if (icon == "C") {
      result = "";
      text = "0";
      firstNumber = '0';
      secondNumber = '0';
    } else if (icon == "+" || icon == "-" || icon == "x" || icon == "/") {
      firstNumber = text;
      result = "";
      operation = icon;
    } else if (icon == "=") {
      secondNumber = text;
      if (operation == "+") {
        result =
            (double.parse(firstNumber) + double.parse(secondNumber)).toString();
      }
      if (operation == "-") {
        result =
            (double.parse(firstNumber) - double.parse(secondNumber)).toString();
      }
      if (operation == "x") {
        result =
            (double.parse(firstNumber) * double.parse(secondNumber)).toString();
      }
      if (operation == "/") {
        result =
            (double.parse(firstNumber) / double.parse(secondNumber)).toString();
      }
    } else if (icon == "<--") {
      if (text.isNotEmpty) {
        result = text.substring(0, text.length - 1);
      }
    } else if (icon == "%") {
      double value = double.parse(text);
      result = (value / 100).toString();
    } else {
      if (icon == ',') {
        if (!text.contains(',')) {
          result = text + icon;
        }
      } else {
        if (text == '0') {
          result = icon;
        } else {
          result = text + icon;
        }
      }
    }

    setState(() {
      text = result;
    });
  }

  Widget calculateButton({
    required int flex,
    required String icon,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: color,
        ),
        child: Text(
          icon,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  Widget zeroButton({
    required int flex,
    required String icon,
    required VoidCallback? onPressed,
  }) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.orange,
        ),
        child: Text(
          icon,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ),
            ),
          ),
          const Divider(color: Colors.white60),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculateButton(
                    color: Colors.white70,
                    flex: 1,
                    icon: 'C',
                    onPressed: () => calculatorFunction('C'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.white70,
                    flex: 1,
                    icon: '%',
                    onPressed: () => calculatorFunction('%'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.white70,
                    flex: 1,
                    icon: '<--',
                    onPressed: () => calculatorFunction('<--'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.blueGrey,
                    flex: 1,
                    icon: '+',
                    onPressed: () => calculatorFunction('+'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '1',
                    onPressed: () => calculatorFunction('1'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '2',
                    onPressed: () => calculatorFunction('2'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '3',
                    onPressed: () => calculatorFunction('3'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.blueGrey,
                    flex: 1,
                    icon: '-',
                    onPressed: () => calculatorFunction('-'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '4',
                    onPressed: () => calculatorFunction('4'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '5',
                    onPressed: () => calculatorFunction('5'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '6',
                    onPressed: () => calculatorFunction('6'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.blueGrey,
                    flex: 1,
                    icon: 'x',
                    onPressed: () => calculatorFunction('x'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '7',
                    onPressed: () => calculatorFunction('7'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '8',
                    onPressed: () => calculatorFunction('8'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: '9',
                    onPressed: () => calculatorFunction('9'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.blueGrey,
                    flex: 1,
                    icon: '/',
                    onPressed: () => calculatorFunction('/'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  zeroButton(
                    flex: 2,
                    icon: '0',
                    onPressed: () => calculatorFunction('0'),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.orange,
                    flex: 1,
                    icon: ',',
                    onPressed: () => calculatorFunction(','),
                  ),
                  const SizedBox(width: 10),
                  calculateButton(
                    color: Colors.blueGrey,
                    flex: 1,
                    icon: '=',
                    onPressed: () => calculatorFunction('='),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
