import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController toLocationController = TextEditingController();
  double? lat;
  double? lng;

  Set<Marker> _marker = Set<Marker>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // final Marker _kmarker = const Marker(
  //     markerId: MarkerId("TravelMarkerId1"),
  //     icon: BitmapDescriptor.defaultMarker,
  //     position: LatLng(37.42796133580664, -122.085749655962));

  // final Marker _kSecondmarker = Marker(
  //     markerId: const MarkerId("TravelMarkerId2"),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: const LatLng(37.43296265331129, -122.08832357078792));

  // static Polyline kPolyline = const Polyline(
  //     polylineId: PolylineId('polylineId'),
  //     points: [
  //       LatLng(37.43296265331129, -122.08832357078792),
  //       LatLng(37.42796133580664, -122.085749655962)
  //     ],
  //     width: 4,
  //     color: Colors.blue);

  @override
  void initState() {
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
    super.initState();
  }

  void _setMarker(LatLng positions) {
    setState(
      () {
        _marker.add(
            Marker(
              icon: BitmapDescriptor.defaultMarker,
              markerId: const MarkerId('TestAppId'), position: positions));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: toLocationController,
              textCapitalization: TextCapitalization.words,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                hintText: "To",
                suffix: IconButton(
                  onPressed: () async {
                    print('this has been pressed');
                    var place = await LocationService()
                        .getToPlace(toLocationController.text);
                    _goToPlace(place);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // _goToPlace;
        },
        label: const Text('Find location'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
     final double latitudes = place['geometry']['location']['lat'];
     lat = latitudes;
     final double longitudes = place['geometry']['location']['lng'];
     lng = longitudes;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat!, lng!), zoom: 12),
      ),
    );

    _setMarker(LatLng(lat!, lng!));
  }
}
