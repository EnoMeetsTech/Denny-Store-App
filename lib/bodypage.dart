import 'package:flutter/material.dart';
import 'package:storeapp/storepage.dart';

void main() {
  runApp(const BodyPage());
}

class BodyPage extends StatelessWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: [
                const Text(
                  'DENNY\'S',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  'Your final shoppping destination...',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  width: 220,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StorePage()));
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                    child: CircularProgressIndicator(color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
