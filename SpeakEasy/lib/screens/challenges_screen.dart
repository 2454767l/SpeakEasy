import 'package:flutter/material.dart';
import 'package:speakeasy/screens/get_started_screen_2.dart';
class Challenges_Screen_1 extends StatefulWidget {
  const Challenges_Screen_1({Key? key}) : super(key: key);

  @override
  State<Challenges_Screen_1> createState() => _NewScreenState();
}

class _NewScreenState extends State<Challenges_Screen_1> {
  bool isButtonActive1 = true;
  bool isButtonActive2 = true;
  bool isButtonActive3 = true;
  bool isButtonActive4 = true;

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
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//Widget buildNavigationButton => FloatingActionButton(),
  );

  //Widget buildSwitch() => ElevatedButton(onPressed: onPressed, child: child).adaptive(value: value, onChanged: onChanged)

  Widget buildNavigateButton() => FloatingActionButton(
    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(30)
    ),
    child: Text('Begin Next Challenge', style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),),
    //icon: Icon(Icons.arrow_circle_right_outlined),
    backgroundColor: Colors.green,
    onPressed: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewScreen2())
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

//Widget buildNavigationButton => FloatingActionButton() {}
}
