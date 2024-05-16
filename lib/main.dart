import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:login_app_project/src/InfoScreen.dart';
import 'package:login_app_project/src/Map2Sreen.dart';
import 'package:login_app_project/src/MapScreen.dart';
//import 'package:flutter_kakao_map_sample/src/home.dart';

InAppLocalhostServer server = InAppLocalhostServer(port: 8080);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await server.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Init',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
// This widget is the root of your application.
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: FloatingActionButton(
                onPressed: () {
                  // 알림 기능
                },
                child: Icon(Icons.notifications), // 알림 아이콘
                tooltip: '알림', // 롱 프레스 시 보이는 텍스트
              ),
            ),
            // 상단 오른쪽 첫 번째 FloatingActionButton
            Positioned(
              top: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  // 프로필 기능
                },
                child: Icon(Icons.account_circle), // 프로필 아이콘
                tooltip: '프로필', // 롱 프레스 시 보이는 텍스트
              ),
            ),
            // 상단 오른쪽 두 번째 FloatingActionButton
            Positioned(
              top: 0,
              right: 56, // FloatingActionButton 크기 및 간격을 고려한 위치 조정
              child: FloatingActionButton(
                onPressed: () {
                  // 설정 기능
                },
                child: Icon(Icons.settings), // 설정 아이콘
                tooltip: '설정', // 롱 프레스 시 보이는 텍스트
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          AssetImage('assets/web/marker.png'), // 실제 이미지 경로로 교체하세요.
                    ),
                    SizedBox(height: 10), // 텍스트와 아바타 사이의 간격
                    Text('2016.10.17'),
                    SizedBox(height: 10), // 텍스트 필드 사이의 간격
                    TextField(
                      decoration: InputDecoration(hintText: '여기에 입력하세요'),
                    ),
                    SizedBox(height: 10), // 텍스트 필드 사이의 간격
                    TextField(
                      decoration: InputDecoration(hintText: '여기에도 입력하세요'),
                    ),
                    // 하단 버튼들
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
// 홈 버튼 기능
                },
                child: Flexible( // Flexible 위젯 추가
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                    children: <Widget>[
                      Icon(Icons.home, size: 24), // 아이콘 크기 조정
                      Text('홈', style: TextStyle(fontSize: 9)), // 텍스트 크기 조정
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
// 편지 버튼 기능
                },
                child: Flexible( // Flexible 위젯 추가
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                    children: <Widget>[
                      Icon(Icons.mail, size: 24), // 아이콘 크기 조정
                      Text('편지', style: TextStyle(fontSize: 9)), // 텍스트 크기 조정
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
// 캘린더 버튼 기능
                },
                child: Flexible( // Flexible 위젯 추가
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                    children: <Widget>[
                      Icon(Icons.calendar_today, size: 24), // 아이콘 크기 조정
                      Text('캘린더', style: TextStyle(fontSize: 9)), // 텍스트 크기 조정
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
// 가이드 버튼 기능
                },
                child: Flexible( // Flexible 위젯 추가
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                    children: <Widget>[
                      Icon(Icons.help, size: 24), // 아이콘 크기 조정
                      Text('가이드', style: TextStyle(fontSize: 9)), // 텍스트 크기 조정
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InfoPage()),
                  );
                },
                child: Flexible( // Flexible 위젯 추가
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 최소 크기로 설정
                    children: <Widget>[
                      Icon(Icons.info, size: 24), // 아이콘 크기 조정
                      Text('정보', style: TextStyle(fontSize: 9)), // 텍스트 크기 조정
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
