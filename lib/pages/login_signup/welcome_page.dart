import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'CommuteSmart';
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final appBarHeight = isLandscape ? 150.0 : 250.0;

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          toolbarHeight: appBarHeight,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: <Color> [
                  Color.fromARGB(255, 3, 153, 177),
                  Color.fromARGB(255, 29, 166, 157),
                  Color.fromARGB(255, 42, 173, 148),
                  Color.fromARGB(255, 	47, 176, 144),
                  Color.fromARGB(255, 	73, 189, 125),
                  Color.fromARGB(255, 	82, 194, 119),
                  Color.fromARGB(255, 95, 201, 109),
                  Color.fromARGB(255, 	126, 217, 88),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Colors.green),
              ),
              SizedBox(height: 30),
              Text(appName, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white)),
            ],
            ),
          ),
        ),
      // appBar: AppBar(
      //   toolbarHeight: 250,
      //   flexibleSpace: Container(
      //     color: Colors.green,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CircleAvatar(
      //           radius: 50,
      //           backgroundColor: Colors.white,
      //           child: Icon(Icons.person, size: 50, color: Colors.green),
      //         ),
      //         SizedBox(height: 30),
      //         Text(appName, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white)),
      //       ],
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WELCOME!', style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('LOGIN'),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('SIGNUP', style: TextStyle(color: Colors.green)),
                  ),
                ),
              ],
            ),
          
        ),
      ),
    );
  }
}
