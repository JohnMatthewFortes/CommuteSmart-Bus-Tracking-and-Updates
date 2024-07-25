import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  String appName = 'CommuteSmart';
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Bus Alert!',
      'message': 'Bus Number 1415, current route Nasugbu to Batangas. \n\nLocation: Lemery Highway Calaca. \nArriving in 1 hour and 13 minutes. \n\n\n1 hour and 5 minutes ago',
      'isExpanded': false,
    },
    {
      'title': 'Bus Alert!',
      'message': 'Bus Number 1520, current route Nasugbu to Batangas. \n\nLocation: Palico - Balayan Batangas Rd, Bauan, Batangas. \nArriving in 32 minutes. \n\n20 minutes ago',
      'isExpanded': false,
    },
    {
      'title': 'Bus Alert!',
      'message': 'Bus Number 1415, current route Batangas to Nasugbu. \n\nLocation: Palico - Balayan Batangas Rd, Tuy Batangas \nArriving in 25 minutes. \n\n5 hours ago',
      'isExpanded': false,
    },
    {
      'title': 'Bus Alert!',
      'message': 'Bus Number 1520, current route Batangas to Nasugbu. \n\nLocation: Palico - Nasugbu Highway, Tuy, Batangas \nArriving in 14 minutes. \n\n5 hours ago',
      'isExpanded': false,
    },
  ];

  void _addNotification() {
    setState(() {
      notifications.insert(0, {
        'title': 'Bus Alert!',
        'message': 'Bus Number 1415, current route Nasugbu to Batangas. \n\nLocation: Diversion Road, Batangas City. \nArriving in 5 minutes. \n\n\nJust now',
        'isExpanded': false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
          children: <Widget>[
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

      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final cardColor = index.isEven ? Colors.teal[300] : Colors.teal[800];
          final expandedColor = cardColor;

          return Container(
            margin: EdgeInsets.all(10.0),
            child: Card(
              elevation: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                ),
              shadowColor: expandedColor,
              color: cardColor,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(10.0),
                height: notification['isExpanded'] ? 220 : 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: expandedColor,
                ),
                child: ListTile(
                  leading: Icon(Icons.notifications_active_rounded, color: Colors.white),
                  title: Text(notification['title'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    notification['message'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                    maxLines: notification['isExpanded'] ? null : 2,
                    overflow: notification['isExpanded'] ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    setState(() {
                      notification['isExpanded'] = !notification['isExpanded'];
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20.0,
        backgroundColor: Colors.teal[100],
        splashColor: Colors.white,
        child: Icon(Icons.refresh, color: Colors.teal[900]),
        onPressed: _addNotification,
      ),
    );
  }
}
