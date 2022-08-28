import 'package:flutter/material.dart';
import 'package:speakeasy/screens/get_started_screen_2.dart';

class ProfileScreen_1 extends StatefulWidget {
  const ProfileScreen_1({Key? key}) : super(key: key);

  @override
  State<ProfileScreen_1> createState() => _NewScreenState();
}

class _NewScreenState extends State<ProfileScreen_1> {
  bool isButtonActive1 = true;
  bool isButtonActive2 = true;
  bool isButtonActive3 = true;
  bool isButtonActive4 = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white10,
    appBar: AppBar(
      title: const Text('MY PROFILE',
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
        /*Container(
              padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 4.0),
              child: const Text('GET STARTED',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(0xFFAFF4C6),
                  )),
            ),*/

        Container(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 4.0),
          child: const Text(
            'USER123',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.green,
            primary: Color(0xFF9747FF),
            minimumSize: const Size(0, 75),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)),
          ),
          onPressed: isButtonActive1
              ? () {
            setState(() => isButtonActive1 = false);
          }
              : null,
          child: const Text(
            'EDIT PROFILE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.green,
            primary: Color(0xFF9747FF),
            minimumSize: Size(0, 75),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)),
          ),
          onPressed: isButtonActive2
              ? () {
            setState(() => isButtonActive2 = false);
          }
              : null,
          child: const Text(
            'LINK WITH SOCIAL MEDIA',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.green,
            primary: Color(0xFF9747FF),
            minimumSize: const Size(0, 75),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60)),
          ),
          onPressed: isButtonActive3
              ? () {
            setState(() => isButtonActive3= false);
          }
              : null,
          child: const Text(
            'EDIT DAILY GOAL',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    ),
  );

  //Widget buildSwitch() => ElevatedButton(onPressed: onPressed, child: child).adaptive(value: value, onChanged: onChanged)

  Widget buildNavigateButton() => FloatingActionButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
    ),
    child: Text('HELP', style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17.0,
    ),),
    //icon: Icon(Icons.arrow_circle_right_outlined),
    backgroundColor: Colors.blue,
    onPressed: (){},
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
