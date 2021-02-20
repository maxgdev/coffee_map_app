import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import './my_google_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debug option off/false
      debugShowCheckedModeBanner: false,
      title: 'Flutter Coffee Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Coffee Map App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  // Warri, Delta, Nigeria 5.544230, 5.760269.
  // New York, US 40.730610, -73.935242.
  static final CameraPosition _startLocation = CameraPosition(
    target: LatLng(5.544230, 5.760269),
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: GoogleMap(
                  initialCameraPosition: _startLocation,
                  onMapCreated: _onMapCreated,
                ),
              ),
            ],
          ),
        ));
  }
}
