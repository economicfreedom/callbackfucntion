import 'package:flutter/material.dart';

void main() {
  runApp(const ParentWidget());
}

// 부모 위젯
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _count = 0;

  void _handleChildButtonPressed() {
    print('자식한테 전달할 함수');
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count ${_count}'),
                ChildWidget(_handleChildButtonPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//자식 위젯
// 1. 자식 객체 생성시에 매개체가 될 매개변수를 받게 설계한다
class ChildWidget extends StatelessWidget {
  final VoidCallback onButtonPressed;

  // 생성자
  const ChildWidget(this.onButtonPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      child: Text('Press me'),
    );
  }
}
