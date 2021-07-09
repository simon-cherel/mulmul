import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewer extends StatefulWidget {
  final String mapStyle;
  MapViewer({Key? key, required this.mapStyle}) : super(key: key);

  @override
  State<MapViewer> createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  Set<Marker> _markers = {};
  late String _mapStyle;
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    _mapStyle = widget.mapStyle;
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/localisation.png');
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      controller.setMapStyle(_mapStyle);
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(48.62510014846943, 2.443414771079682),
          icon: mapMarker,
          infoWindow: InfoWindow(title: 'test', snippet: 'description test')));
    });
  }

  static const CameraPosition _telecomSudParis = CameraPosition(
    target: LatLng(48.62510014846943, 2.443414771079682),
    zoom: 11.5,
  );

  Widget build(BuildContext context) {
    return GoogleMap(
      buildingsEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _telecomSudParis,
      onMapCreated: onMapCreated,
      markers: _markers,
    );
  }

  // Future<void> _goTo(CameraPosition end) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(end));
  // }
}
