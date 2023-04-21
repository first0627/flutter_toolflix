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
  //BuildContext는 모든 상위 요소들에 대한 정보야
  //즉 위젯 트리에 대한 정보가 담겨있지
  //매우 먼 요소의 데이터를 가져 올 수 있기 때문에 아주 유용하다.
  //이게 context가 하는것이다.

  bool showTitle = true;
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0; //대부분 상태변수를 여기에 선언한다.

  @override
  void initState() {
    super.initState();
    print('initState!');

    //가끔 부모 요소에 의존하는 데이터를 초기화해야하는 경우가 있다.
    //가끔 데이터를 초기화하기 위 context를 사용함
    //종종 API에서 업데이트를 구독하고 싶음
    //항상 build 메서드 전에 실행된다.
    //api어데이트나 이벤트 리스너로 부터 구독 취소하거나 form의 리스너로 부터 벗어나고 싶을때
    //우리의 위젯이 위젯 트리에서 제거되기 전에 뭔가 하고 싶을때
  }

  @override
  void dispose() {
    //위젯이 스크린에서 제거될 때 호출되는 메소드
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
