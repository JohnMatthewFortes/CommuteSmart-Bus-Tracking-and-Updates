import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class VerticalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var verticalPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 3;

    Offset start = Offset(size.width, 0);
    Offset end = Offset(size.width, size.height);

    canvas.drawLine(start, end, verticalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  String userLocation = 'Golden Country Homes, Alangilan, Batangas';
  LatLng mapCenter = LatLng(13.784306316760675, 121.07500214364329);
  bool isLoading = false;

  final MapController _mapController = MapController();
  double _currentZoom = 18.0;

  void _changeUserLocation() async {
    setState(() {
      isLoading = true;
      }
    );

  await Future.delayed(Duration(seconds: 2));

    setState(() {
      userLocation = 'Grand Terminal, Diversion Road, Batangas';
      mapCenter = LatLng(13.78937155277085, 121.06264527768944);
      isLoading = false;
      }
    );
  }

    void _zoomIn() {
      setState(() {
        _currentZoom = (_currentZoom + 1).clamp(10.0, 18.0);
        _mapController.move(_mapController.center, _currentZoom);
      });
    }

    void _zoomOut() {
      setState(() {
        _currentZoom = (_currentZoom - 1).clamp(10.0, 18.0);
        _mapController.move(_mapController.center, _currentZoom);
      });
    }

  @override
  Widget build(BuildContext context) {
    final appName = 'CommuteSmart';
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var isLandscape = mediaQuery.orientation == Orientation.landscape;
    var mapHeight = isLandscape ? screenHeight * 0.4 : screenHeight * 0.5;

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

      body: ListView(
        children: <Widget> [
          Container (
            height: mapHeight,
            margin: EdgeInsets.all(5.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                child: isLoading
                  ? LinearProgressIndicator(
                    backgroundColor: Colors.greenAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.teal[50]),
                    minHeight: 10.0,
                  )
                : Container(
                // ===========================================================//
                //                                                           //
                //================      MAPS CONTAINER       ================//
                //                                                           //
                //===========================================================//
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: mapCenter,
                    zoom: _currentZoom,
                    maxZoom: 18.0,
                    minZoom: 10.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                      userAgentPackageName: 'dev.flutter_map.example',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: mapCenter,
                          builder: (ctx) => Icon(Icons.location_on, color: Colors.red, size: 40),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.zoom_in, color: Colors.black, size: 40,),
                              onPressed: _zoomIn,
                            ),
                            IconButton(
                              icon: Icon(Icons.zoom_out, color: Colors.black, size: 40),
                              onPressed: _zoomOut,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 50,
              color: Colors.teal[800],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: isLoading
                    ? LinearProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                      valueColor: AlwaysStoppedAnimation(Colors.teal[50]),
                      minHeight: 10.0,
                    )
                    : ListTile(
                  leading: Icon(Icons.location_pin, color: Colors.white, size: 40),
                  title: Text('Location', 
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(userLocation,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            // height: 110,
            child: Card(
              elevation: 50,
              color: Colors.teal[300],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Text('4',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 40),
                  ),
                  title: Text('Buses in Transit', 
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.teal[100],
        splashColor: Colors.white,
        child: Icon(Icons.gps_fixed, color: Colors.teal[800]),
        onPressed: () {
          _changeUserLocation();
        },
      ),
    );
  }
}
