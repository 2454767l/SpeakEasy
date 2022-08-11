import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

class NewScreen3 extends StatefulWidget {
  const NewScreen3({Key? key}) : super(key: key);

  @override
  State<NewScreen3> createState() => _NewScreen3State();
}



class _NewScreen3State extends State<NewScreen3> {
  bool isButtonActive1 = true;
  bool isButtonActive2 = true;
  bool isButtonActive3 = true;
  bool isButtonActive4 = true;


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white10,
    appBar: AppBar(
      title: const Text('GET STARTED',
          style: TextStyle(
            color: Color(0xFFAFF4C6),
            fontSize: 35.0,
          )),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
      ],
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.black12,
      elevation: 100,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(),
      ),
    ),

    /*Timer(Duration(seconds = 5), (){
    });
    floatingActionButton: Container(
    height: 65,
    width: 350,
    child: buildNavigateButton(),
  ),*/
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
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
          decoration: const BoxDecoration(
              color: Color(0xFF9747FF),
              borderRadius: BorderRadius.all(Radius.circular(35))),
          height: 120,
          width: 200,
          child: const Text('GENERATING YOUR PERSONALIZED COURSE, WE\'LL JUST BE A SEC!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),),
        ),
        const SizedBox(height: 35),
        CircularPercentIndicator(
          animation: true,
            animationDuration: 10000,
            radius: 110.0,
        percent: 1,
        lineWidth: 20,
          progressColor: Colors.green,
          backgroundColor: Colors.white10,
          circularStrokeCap: CircularStrokeCap.round,

        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 15.0),
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(35))),
          height: 90,
          //width: 200,
          child: const Align(
            alignment: Alignment.center,
            child: Text('Did you know? Fear of public speaking cuts wages by 10%!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    ),
  );

  //Widget buildSwitch() => ElevatedButton(onPressed: onPressed, child: child).adaptive(value: value, onChanged: onChanged)

  Widget buildNavigateButton() => FloatingActionButton(
    shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(30)
    ),
    child: Text('Generate My Personalized Course', style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15.0,
    ),),
    //icon: Icon(Icons.arrow_circle_right_outlined),
    backgroundColor: Colors.green,
    onPressed: (){
      //Navigator.push(context,
        //  MaterialPageRoute(builder: (context) => NewScreen2())
      //);
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


