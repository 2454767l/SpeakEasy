import 'package:flutter/material.dart';
import 'package:speakeasy/screens/get_started_screen_1.dart';
import 'package:speakeasy/style.dart';

void main() {
  runApp(const NewScreen_home());
}

class NewScreen_home extends StatelessWidget {
  const NewScreen_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeakEasy',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(titleTextStyle: AppBarTextStyle),
          textTheme: const TextTheme(
            titleLarge: TitleTextStyle,
            bodyMedium: bodyTextStyle,
          )
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(
          fontSize: 40.0,
          color: Color(0xFFAFF4C6),
        )
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
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
                    )
                ),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




