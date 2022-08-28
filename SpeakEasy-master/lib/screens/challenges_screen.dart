import 'package:flutter/material.dart';
import 'package:speakeasy/screens/get_started_screen_2.dart';

class Challenges_Screen_1 extends StatefulWidget {
  const Challenges_Screen_1({Key? key}) : super(key: key);

  @override
  State<Challenges_Screen_1> createState() => _NewScreenState();
}

class _NewScreenState extends State<Challenges_Screen_1> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: const Text('CHALLENGES',
              style: TextStyle(
                color: Color(0xFFAFF4C6),
                fontSize: 35.0,
              )),
          centerTitle: true,
          brightness: Brightness.light,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.black12,
          elevation: 100,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
        ),
        floatingActionButton: Container(
          width: 300,
          child: buildNavigateButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  Widget buildNavigateButton() => FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'Begin Next Challenge',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        backgroundColor: Colors.green,
        onPressed: () {},
      );
}
