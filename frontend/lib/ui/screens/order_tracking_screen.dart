import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/ui/screens/loading_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({required this.addressList, super.key});

  final List<Address> addressList;

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> destinationLocations = [];

  @override
  void initState() {
    setState(() {
      widget.addressList.forEach((element) {
        destinationLocations.add(LatLng(
          element.latitude,
          element.longitude,
        ));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.addressList.isEmpty
          ? LoadingScreen()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(widget.addressList[0].latitude,
                      widget.addressList[0].longitude),
                  zoom: 10),
              markers: widget.addressList
                  .map((address) => Marker(
                      infoWindow: InfoWindow(title: address.name),
                      markerId: MarkerId('destination'),
                      position: LatLng(address.latitude, address.longitude)))
                  .toSet(),
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
    );
  }
}
