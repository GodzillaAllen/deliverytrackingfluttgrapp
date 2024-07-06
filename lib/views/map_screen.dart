import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';

class MapScreen extends StatelessWidget {
  final AppController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Tracking'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _controller.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_controller.deliveries.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return MapboxMap(
          accessToken: "YOUR_MAPBOX_ACCESS_TOKEN",
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194),
            zoom: 10,
          ),
          onMapCreated: (MapboxMapController controller) {
            _controller.deliveries.forEach((delivery) {
              controller.addSymbol(SymbolOptions(
                geometry: LatLng(delivery['latitude'], delivery['longitude']),
                iconImage: "marker-15",
              ));
            });
          },
        );
      }),
    );
  }
}
