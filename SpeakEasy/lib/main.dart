import 'package:flutter/material.dart';
import 'package:speakeasy/screens/home_screen_new_user.dart';
import 'package:speakeasy/screens/get_started_screen_1.dart';
import 'package:speakeasy/screens/get_started_screen_2.dart';
import 'package:speakeasy/screens/practice_screen_1.dart';
import 'package:speakeasy/screens/challenges_screen.dart';
import 'package:speakeasy/screens/my_profile_screen.dart';
import 'package:speakeasy/screens/practice_screen_2.dart';
import 'style.dart';

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp0());
}

class MyApp0 extends StatelessWidget {
  const MyApp0({Key? key}) : super(key: key);
  //final _selectedIndex = 0;
  // This widget is the root of your application.
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
      home: const MyBottomNavigationBar(),
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

  void onTappedBar(int index){
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




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(
          fontSize: 40.0,
          color: Color(0xFFAFF4C6),
        )),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
          ),
        ],
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        backgroundColor: Colors.black12,
        elevation: 100,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
      ),
        body: Center(
          child: Column(
            children: [
              /*Container(
                padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 4.0),
                child: const Text('Home',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFFAFF4C6),
                    )),
              ),*/
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 4.0),
                child: const Text('My Courses'),
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 50.0, 65.0, 30.0),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                        'It doesn\'t look like you have started any courses yet!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Get_Started_screen_1(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                  decoration: const BoxDecoration(
                      color: Color(0xFF9747FF),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  height: 130,
                  width: 300,
                  child: const Text('TAP HERE TO GET STARTED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
              ),
              //_children[_currentIndex],
            ],
          ),
        ),

      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: 0,
        //onTap: onTappedBar,
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
              label: 'Challenges',
              backgroundColor: Colors.white10),
        ],
      ),
    );
  }
}




