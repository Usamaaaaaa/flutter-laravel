// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, file_names, unused_import, unused_field, avoid_types_as_parameter_names, await_only_futures, unnecessary_this, unnecessary_new, avoid_print

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mylocation extends StatefulWidget {
  const Mylocation({Key key}) : super(key: key);

  @override
  State<Mylocation> createState() => _MylocationState();
}

//6
class _MylocationState extends State<Mylocation> {
  StreamSubscription _locsub;

  Location _location = Location();
  Marker marker;
  Circle _circle;
  GoogleMapController con;
  Uint8List image;
  String role;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _Mposition = CameraPosition(
    // target: LatLng(33.43287, 73.05106),
    target: LatLng(33.5503036, 73.0893269),
    zoom: 10.35,
  );
  List<Marker> _marker = [];
  List<LatLng> _latlng = [
    LatLng(33.43287, 73.05106),
    LatLng(33.524121, 73.1144761),
    LatLng(33.520437, 73.0543497),
    LatLng(33.5503036, 73.0893269),
    LatLng(33.5686478, 73.1672408),
    LatLng(33.5873125, 73.0413535),
    LatLng(33.6431229, 73.0718478),
    LatLng(33.7246613, 73.0533055),
    LatLng(33.7354874, 73.1766592),
    LatLng(33.6430372, 73.1668119),
  ];

  Set<Polyline> _polyline = {};
  List<Marker> _list = const [
    //done
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.5503036, 73.0893269),
        infoWindow: InfoWindow(
            title:
                "Snow White Dry Cleaners, H42C+4WF, Civic Center Bahria Town Civic Center Bahria Town,")),
    //done
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.520437, 73.0543497),
        infoWindow: InfoWindow(
            title:
                "Snowhite Drycleaners, G3CP+5WF, Bahria Intellectual Village Bahria Town Intellectual Village,")),
    //done
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(33.6431229, 73.0718478),
        infoWindow: InfoWindow(
            title:
                "Snowhite Dry Cleaners, Shop # 4, Al Naseer Plaza, Murree Rd, Saddar, Rawalpindi")),
    //done
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(33.5873125, 73.0413535),
        infoWindow: InfoWindow(
            title:
                "Snowhite Dry Cleaners, H3PF+WPF, Rizwan Plaza, Airport Rd, Jhanda Chichi")),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(33.7354874, 73.1766592),
        infoWindow: InfoWindow(
            title:
                "Twin City Plaza, Mir Chakar Khan Rd, I-8 Markaz ICT, Islamabad,")),

    Marker(
        markerId: MarkerId('6'),
        position: LatLng(33.524121, 73.1144761),
        infoWindow: InfoWindow(
            title: "G4FW+JXV, Sector A Sector C DHA Phase II, Islamabad")),

    Marker(
        markerId: MarkerId('7'),
        position: LatLng(33.5686478, 73.1672408),
        infoWindow:
            InfoWindow(title: "H692+F34, Block D Naval Anchorage, Islamabad")),

    Marker(
        markerId: MarkerId('8'),
        position: LatLng(33.7246613, 73.0533055),
        infoWindow: InfoWindow(
            title:
                "P3FP+VG6, ATC Centre, AK Fazal-ul-Haq Rd, Block A, Blue Area, Islamabad")),

    Marker(
        markerId: MarkerId('9'),
        position: LatLng(33.6430372, 73.1668119),
        infoWindow: InfoWindow(
            title:
                "J5VX+6W6, Affan Market, Lehtrar Rd, Partal, Partal Town, Islamabad,")),
    Marker(
        markerId: MarkerId('10'),
        position: LatLng(33.43287, 73.05106),
        infoWindow: InfoWindow(title: "SnoWhite Dry Cleaners")),
  ];

  //    @33.5686478,73.1672408 H692+F34, Block D Naval Anchorage, Islamabad, Islamabad Capital Territory, Pakistan

//  @33.7246613,73.0533055 P3FP+VG6, ATC Centre, AK Fazal-ul-Haq Rd, Block A, Blue Area, Islamabad, ICT, Islamabad, Pakistan

//  @33.6430372,73.1668119 J5VX+6W6, Affan Market, Lehtrar Rd, Partal, Partal Town, Islamabad, Islamabad Capital Territory 44600, Pakistan
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // image =   getMarker();
    // getLocation();

    super.initState();
    onload();
    _marker.addAll(_list);

    _polyline.add(Polyline(
        polylineId: PolylineId('1'), points: _latlng, color: Colors.blue));
    getLocation();
    // getImage();
  }

  onload() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() async {
      role = await pref.getString('role');
      // print(role);
    });
  }

  // void getImage() async {
  //   image = await getMarker();

// 32.34352 74.04530E
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Van Location'),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _Mposition,
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polylines: _polyline,
        ),
      ),
      // 33.43287, 73.05106
    );
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('images/car.png');
    return byteData.buffer.asUint8List();
  }

  void updateMarker(LocationData ld, Uint8List img) {
    // print('locaation change');
    LatLng latlag = LatLng(ld.latitude, ld.longitude);
    this.setState(() {
      _marker.add(Marker(
          markerId: MarkerId('Van 1'),
          infoWindow:
              InfoWindow(title: "driver: Mukhtar ,  phone:03065357684 "),
          position: latlag,
          // position: LatLng(ld.latitude, ld.longitude),
          rotation: ld.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(img)));
      _circle = Circle(
          circleId: CircleId('car'),
          radius: ld.accuracy,
          zIndex: 1,
          strokeColor: Colors.orange,
          center: latlag,
          // center: LatLng(33.43287, 73.05106),
          fillColor: Colors.orange.withAlpha(70));
    });
  }

  void getLocation() async {
    try {
      // Uint8List image = await getMarker();
      image = await getMarker();
      // print(role);
      if (role == "driver") {
        // print(role);
        var location = await _location.getLocation();
        updateMarker(location, image);
      }
      if (_locsub != null) {
        _locsub.cancel();
      }
      _locsub = _location.onLocationChanged.listen((newloc) {
        if (con != null) {
          con.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              target: LatLng(newloc.latitude, newloc.longitude))));
        }
        updateMarker(newloc, image);
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print("permission denied");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_locsub != null) {
      _locsub.cancel();
    }
  }
}
