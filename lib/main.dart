import 'package:flutter/material.dart';

const taxAmount = 15;
const priceAmount = 30;
void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  //여기의 데이터는 클래스 프로퍼티이다.\

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //여기에 우리 UI를 그리는곳 여기의 데이터가 고쳐지면 새로고침되면서 최신 데이터를 보여줌
  int counter = 0;

  void onClicked() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
