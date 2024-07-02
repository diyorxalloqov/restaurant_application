import 'package:restaurant_app/modules/global/imports/app_imports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickUpMap extends StatefulWidget {
  const PickUpMap({super.key});

  @override
  State<PickUpMap> createState() => PickUpMapState();
}

class PickUpMapState extends State<PickUpMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex =
  CameraPosition(target: LatLng(41.311081, 69.240562), zoom: 14.4746);

  Map<MarkerId, Marker> markers = {};

  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  void _addMarkers(LatLng point, String markerName) {
    final MarkerId markerId = MarkerId(markerName);
    final Marker marker = Marker(
        markerId: markerId,
        position: point,
        infoWindow: InfoWindow(
          title: markerName,
          snippet: 'Marker Snippet',
        ),
        onTap: () {});

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he(360),
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (point) {
              _addMarkers(point, "Destination");
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SearchBar(
                hintText: 'searchHint'.tr(),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 15)),
                leading: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}