import 'package:flutter/material.dart';
import 'bus_page/busOne.dart';
import 'bus_page/busTwo.dart';
import 'bus_page/busThree.dart';
import 'bus_page/busFour.dart';


class BusLocation extends StatefulWidget {
  @override
  _BusRouteState createState() => _BusRouteState();
}

class _BusRouteState extends State<BusLocation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    final List<Widget> _pages = [
    BusOne(),
    BusTwo(),
    BusThree(),
    BusFour(),
  ];

  void _showAlertMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[100],
          title: Text('BUS ALERT!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.teal[900]),
          ),
          content: Text('Bus 1415 arriving at your location in 1 hour and 13 minutes.',
          style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget> [
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final appName = 'CommuteSmart';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        toolbarHeight: 100,
        flexibleSpace: Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(appName, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white)
                ),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset('assets/images/logo2.png',
                fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
                title: Text('HOME', 
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                   fontWeight: FontWeight.bold
                )
                ),
                leading: Icon(Icons.home, color: Colors.green, size: 30),
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            SizedBox(height: 5),
            ListTile(
              title: Text('BUSES',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Colors.black
                 fontWeight: FontWeight.bold
              )
              ),
              leading: Icon(Icons.bus_alert, color: Colors.green, size: 30),
              onTap: () {
                Navigator.pushNamed(context, '/bus_location');
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text('TERMINAL',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Colors.black
                 fontWeight: FontWeight.bold
              )
              ),
              leading: Icon(Icons.emoji_transportation, color: Colors.green, size: 30),
              onTap: () {
                Navigator.pushNamed(context, '/terminal');
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text('NOTIFICATIONS', 
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Colors.black
                 fontWeight: FontWeight.bold
              )
              ),
              leading: Icon(Icons.notifications, color: Colors.green, size: 30),
              onTap: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            SizedBox(height: 5),
            ListTile(
              title: Text('LOGOUT', 
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                // color: Colors.black
                 fontWeight: FontWeight.bold
              )
              ),
              leading: Icon(Icons.logout, color: Colors.green, size: 30),
              onTap: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/welcome');
              },
            ),
          ],
        ),
      ),
      
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one, color: Colors.green),
            label: 'One'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two, color: Colors.green),
            label: 'Two'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3, color: Colors.green),
            label: 'Three',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_4, color: Colors.green),
            label: 'Four'
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: Colors.teal[100],
            splashColor: Colors.white,
            child: Icon(Icons.notifications_active, color: Colors.teal[800]),
            onPressed: () {
              _showAlertMessage();
            },
          ),
    );
  }
}


