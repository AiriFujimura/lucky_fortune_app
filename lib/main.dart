import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '今日のラッキー占い',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今日のラッキー占い'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '今日の運勢を占おう！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneScreen()),
                );
              },
              child: Text(
                '占いをする',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FortuneScreen extends StatefulWidget {
  @override
  _FortuneScreenState createState() => _FortuneScreenState();
}

class _FortuneScreenState extends State<FortuneScreen> {
  final List<String> luckyItems = [
    'リボン',
    'ぬいぐるみ',
    'ピンクのペン',
    'ハートのアクセサリー',
    'キャンディー'
  ];
  final List<String> luckyColors = ['ピンク', 'パープル', 'ミントグリーン', 'ゴールド', 'ホワイト'];
  String? luckyItem;
  String? luckyColor;

  @override
  void initState() {
    super.initState();
    _refreshFortune();
  }

  void _refreshFortune() {
    setState(() {
      luckyItem = luckyItems[Random().nextInt(luckyItems.length)];
      luckyColor = luckyColors[Random().nextInt(luckyColors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('占い結果'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '今日のラッキーアイテムは\n',
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                    text: luckyItem,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  TextSpan(text: '\nそしてラッキーカラーは\n'),
                  TextSpan(
                    text: luckyColor,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                  ),
                  onPressed: _refreshFortune,
                  child: Text('もう一度占う'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('戻る'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
