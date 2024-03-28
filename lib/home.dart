import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var controllerwkg = TextEditingController();
  var controllerhft = TextEditingController();
  var controllerhin = TextEditingController();
  var result = "";
  var remarks = "";
  var backColor =const Color.fromARGB(255, 230, 205, 133);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controllerwkg,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Weight',
                  labelText: 'Weight',
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: controllerhft,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Height',
                  labelText: 'Height in ft',
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controllerhin,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Height',
                  labelText: 'Height in inches',
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 106, 7),
                      elevation: 5),
                  onPressed: () {
                    var wkg = controllerwkg.text.toString();
                    var hft = controllerhft.text.toString();
                    var hin = controllerhin.text.toString();
                    if (wkg != "" && hft != "" && hin != "") {
                      var intwkg = int.parse(wkg);
                      var inthft = int.parse(hft);
                      var inthin = int.parse(hin);
                      var totalinches = (inthft * 12) + inthin;
                      var totalcm = totalinches * 2.54;
                      var totalm = totalcm / 100;
                      var bmi = intwkg / (totalm * totalm);
                      result = "Your BMI is ${bmi.toStringAsFixed(3)}";
                      setState(() {
                        if (bmi < 18.5) {
                          remarks = "You are underweight";
                          backColor = Colors.red;
                          setState(() {
                            
                          });
                        }
                        else if (bmi>26){
                          remarks = "You are Over Weight";
                          backColor = Colors.red;
                          setState(() {
                            
                          });
                        }
                        else{
                          remarks = "You`re just Perfect";
                          backColor = Colors.green;
                          setState(() {
                            
                          });
                        }
                      });
                    } else {
                      result = "It is empty";
                      setState(() {});
                    }
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              remarks,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
