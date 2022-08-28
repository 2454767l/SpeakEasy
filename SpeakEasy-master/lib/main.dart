import 'package:flutter/material.dart';
import 'package:speakeasy/screens/home_screen_new_user.dart';
import 'package:speakeasy/screens/challenges_screen.dart';
import 'package:speakeasy/screens/my_profile_screen.dart';
import 'package:speakeasy/screens/practice_screen_1.dart';
import 'style.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp0());
}

class MyApp0 extends StatelessWidget {
  const MyApp0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeakEasy',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(titleTextStyle: AppBarTextStyle),
          textTheme: const TextTheme(
            titleLarge: TitleTextStyle,
            bodyMedium: bodyTextStyle,
          )),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    NewScreen_home(),
    Practice_Screen_1(),
    Challenges_Screen_1(),
    ProfileScreen_1(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.white10),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded),
              label: 'Practice',
              backgroundColor: Colors.white10),
          BottomNavigationBarItem(
              icon: Icon(Icons.content_paste_rounded),
              label: 'Challenges',
              backgroundColor: Colors.white10),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'My Profile',
              backgroundColor: Colors.white10),
        ],
      ),
    );
  }
}
