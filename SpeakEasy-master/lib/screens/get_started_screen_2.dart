import 'package:flutter/material.dart';
import 'package:speakeasy/screens/generating_course_screen.dart';

class NewScreen2 extends StatefulWidget {
  const NewScreen2({Key? key}) : super(key: key);

  @override
  State<NewScreen2> createState() => _NewScreen2State();
}

class _NewScreen2State extends State<NewScreen2> {
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.black12,
          elevation: 100,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(),
          ),
        ),
        floatingActionButton: Container(
          height: 65,
          width: 350,
          child: buildNavigateButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 4.0),
              child: const Text(
                'PLEASE SELECT YOUR PREFERRED LESSON DURATION',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(80.0, 25.0, 65.0, 15.0),
              child: const Align(
                alignment: Alignment.center,
                child: Text('I am looking to improve my public speaking for...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    )),
              ),
            ),
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
                '5 Min',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                '10 Min',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                      setState(() => isButtonActive3 = false);
                    }
                  : null,
              child: const Text(
                '15 Min',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: Colors.green,
                primary: Color(0xFF9747FF),
                minimumSize: Size(0, 75),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)),
              ),
              onPressed: isButtonActive4
                  ? () {
                      setState(() => isButtonActive4 = false);
                    }
                  : null,
              child: const Text(
                '20 Min',
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

  Widget buildNavigateButton() => FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'Generate My Personalized Course',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewScreen3()));
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
