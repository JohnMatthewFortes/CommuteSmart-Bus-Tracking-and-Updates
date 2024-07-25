import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<LatLng>> fetchRoute(LatLng start, LatLng end, List<LatLng> waypoints) async {
  String waypointsString = waypoints.map((w) => '${w.longitude},${w.latitude}').join(';');
  final response = await http.get(Uri.parse(
    'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};$waypointsString;${end.longitude},${end.latitude}?overview=full&geometries=geojson'
  ));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> coordinates = data['routes'][0]['geometry']['coordinates'];
    return coordinates.map((c) => LatLng(c[1], c[0])).toList();
  } else {
    throw Exception('Failed to load route');
  }
}

class TerminalNasugbu extends StatefulWidget {
  @override
  _TerminalNasugbuState createState() => _TerminalNasugbuState();
}

class _TerminalNasugbuState extends State<TerminalNasugbu> {

  List<LatLng> _route = [];
  final MapController _mapController = MapController();
  double _currentZoom = 18.0;

  @override
  void initState() {
    super.initState();
    _loadRoute();
  }

  Future<void> _loadRoute() async {
    final start = LatLng(13.790357780861818, 121.06160730136692); // Grandterminal
    final end = LatLng(14.072046193391696, 120.6324030734456); // BSC Terminal Nasugbu
    
    final waypoints = [
    LatLng(13.806982455006827, 120.99595118204698),
    LatLng(13.793562618041781, 121.00702334064147),
    LatLng(13.790145020719772, 121.00762415544891),
    LatLng(13.771118091790147, 121.05083990671746),
    LatLng(13.789335252670947, 121.06267050283068),
  ];
    
    
    final route = await fetchRoute(start, end, waypoints);
      setState(() {
        _route = route;
      });
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
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var isLandscape = mediaQuery.orientation == Orientation.landscape;
    var mapHeight = isLandscape ? screenHeight * 0.4 : screenHeight * 0.5;
    return ListView(
        children: <Widget> [
          Container(
            height: mapHeight,
            margin: EdgeInsets.all(5.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                child: Container(
                  // color: Colors.grey,
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: LatLng(14.07202379500262, 120.63239604234157),
                      zoom: _currentZoom,
                      minZoom: 10.0,
                      maxZoom: 18.0,
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
                            point: LatLng(14.07202379500262, 120.63239604234157),
                            builder: (ctx) => Icon(Icons.location_on, color: Colors.green, size: 40),
                          ),
                        ],
                      ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: _route,
                            strokeWidth: 7.0,
                            color: Colors.blue,
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
              color: Colors.teal[900],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                      ListTile(
                      leading: Icon(Icons.location_pin, color: Colors.white),
                      title: Text('Bus Location', 
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      subtitle: Text('BSC Bus Terminal Nasugbu',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.numbers, color: Colors.white),
                      title: Text('Bus Number', 
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      subtitle: Text('Bus Number 1620',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                     
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 50,
              color: Colors.teal[600],
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                      ListTile(
                      leading: Icon(Icons.directions_bus, color: Colors.white),
                      title: Text('Route', 
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      subtitle: Text('Nasugbu BSC Terminal to Batangas City Grand Terminal',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications_active, color: Colors.white),
                      title: Text('Estimated Time of Departure', 
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      subtitle: Text('20 minutes',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }


}