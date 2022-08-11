import 'package:flutter/material.dart';
import 'package:speakeasy/screens/practice_screen_2.dart';

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Practice_Screen_1 extends StatefulWidget {
  const Practice_Screen_1({Key? key}) : super(key: key);

  @override
  State<Practice_Screen_1> createState() => _NewScreenState();
}

class _NewScreenState extends State<Practice_Screen_1> {
  bool isButtonActive1 = true;
  bool isButtonActive2 = true;
  bool isButtonActive3 = true;
  bool isButtonActive4 = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white10,
    appBar: AppBar(
      title: const Text('PRACTICE',
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
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//Widget buildNavigationButton => FloatingActionButton(),
      body: ListView(
          children: [
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                decoration: const BoxDecoration(
                    color: Color(0xFF9747FF),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                height: 250,
                width: 200,
                child: const Text('THIS IS WHERE YOU CAN PRACTICE YOUR PUBLIC SPEAKING SKILLS WITHOUT LIMITATION '
                    'AND WE WILL PROVIDE FEEDBACK ON HOW YOU DID!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
          ]
      )
  );

  //Widget buildSwitch() => ElevatedButton(onPressed: onPressed, child: child).adaptive(value: value, onChanged: onChanged)

  Widget buildNavigateButton() => FloatingActionButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
    ),
    child: Text('Tap Here To Begin Recording', style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),),
    //icon: Icon(Icons.arrow_circle_right_outlined),
    backgroundColor: Colors.green,
    onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Practice_Screen_2())
      );
    },
  );

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }

}




