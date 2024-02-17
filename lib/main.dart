import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;

  void increment() {
    setState(() {
      value++;
     // HapticFeedback.vibrate();
      if(value==7 ||value==21||value==100||value==50){
        HapticFeedback.vibrate();
        print('vibrate:$value');
      }
    }
    );
  }

  void decrement() {
    setState(() {
      if(value>0) {
        value--;
        //HapticFeedback.lightImpact();
      }
      else{
        value=0;
      }
    });
  }

  void reset() {
    setState(() {
      value = 0;
      HapticFeedback.lightImpact();
    });
  }
  Color bgc=Color(65451);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgc,
        body: SafeArea(
          child: Container(

            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tasbi.png'), // Path to your image
                  fit: BoxFit.cover, // Controls how the image fills the container
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  alignment: Alignment.center,
                  child: Text(
                    'Tasbi',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width /5,
                ),

                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width /1.2,
                  child: Text(
                    '$value',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color:Colors.cyanAccent
                  ),

                ),

                SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: () {
                  increment();

                },
                  child: Text('ADD'),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.blueAccent,
                      fixedSize: Size(170, 90),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    decrement();
                  },
                  child: Text('Sub'),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(170, 70),
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 70),
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 5, // Elevation (shadow)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // BorderRadius
                      ),
                    ),
                    child: Text('Reset'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
