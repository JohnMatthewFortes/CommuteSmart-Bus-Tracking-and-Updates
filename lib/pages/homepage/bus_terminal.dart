import 'package:flutter/material.dart';
import 'terminal_page/terminal_nasugbu.dart';
import 'terminal_page/terminal_batangascity.dart';



class BusTerminal extends StatefulWidget {

  @override
  _BusTerminalState createState() => _BusTerminalState();

}

class _BusTerminalState extends State<BusTerminal> {
  String nasugbuTerminal = 'BSC Bus Terminal Nasugbu';
  String batangascityterminal = 'Batangas City Grand Terminal';

  int _currentIndex = 0;

  void _onNavigationTapped(int indexTerminal) {
    setState(() {
      _currentIndex = indexTerminal;
    });
  }

  final List<Widget> _terminalPages = [
    TerminalNasugbu(),
    TerminalBatangasCity(),
  ];  

  @override
  Widget build(BuildContext context) {
    final appName = 'CommuteSmart';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 100,
        flexibleSpace: Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(appName, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white),
                )
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
                 fontWeight: FontWeight.bold
              )
              ),
              leading: Icon(Icons.logout, color: Colors.green, size: 30),
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
            ),
          ],
        ),
      ),

      body: _terminalPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onNavigationTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_transportation_outlined, color: Colors.green),
            label: 'Nasugbu'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_transportation_outlined, color: Colors.green),
            label: 'Batangas City'
          ),
        ],
      ),
    );
  }

}

