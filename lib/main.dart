import 'package:bmi/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;

  void calculateBmi() {
    var wt = wtController.text.toString();
    var ft = ftController.text.toString();
    var inches = inController.text.toString();

    if (wt != "" && ft != "" && inches != "") {
      //BMi calculations
      var int_wt = int.parse(wt);
      var int_ft = int.parse(ft);
      var int_inches = int.parse(inches);

      var total_inches = (int_ft * 12) + int_inches;

      var total_cm = total_inches * 2.54;

      var total_m = total_cm / 100;

      var bmi = int_wt / (total_m * total_m);

      var msg = "";
      if (bmi > 25) {
        msg = "You're OverWeight!!";
        bgColor = Colors.orange.shade200;
      } else if (bmi < 18) {
        msg = "You're UnderWeight!!";
        bgColor = Colors.red.shade200;
      } else {
        msg = "You're Healthy";
        bgColor = Colors.green.shade200;
      }
      setState(() {
        result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";
      });
    } else {
      setState(() {
        result = "Please Fill all neccessary Fields!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("YourBMI")),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Chech Your BMI",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 21),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Your Weight(in kg)"),
                        prefixIcon: Icon(
                          Icons.line_weight,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Your height(in feet)"),
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Your height(in inches)"),
                        prefixIcon: Icon(
                          Icons.height,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 21),
                  ElevatedButton(
                      onPressed: () {
                        calculateBmi();
                      },
                      child: Text("Calculate")),
                  SizedBox(height: 21),
                  Text(
                    result,
                    style: TextStyle(fontSize: 21),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
