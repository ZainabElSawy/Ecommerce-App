import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/routes.dart';
import 'package:ecommerce_app/features/address/presentation/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../generated/l10n.dart';

class AddressAdd extends StatefulWidget {
  const AddressAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
  late Completer<GoogleMapController> _controller;
  Position? position;
  static CameraPosition? _kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    setState(() {});
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    setState(() {});
  }

  @override
  void initState() {
    _controller = Completer<GoogleMapController>();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).addnewaddress)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _kGooglePlex == null
              ? const CustomLoadingWidget()
              : Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: markers.toSet(),
                        onTap: (LatLng latLng) {
                          addMarkers(latLng);
                        },
                        initialCameraPosition: _kGooglePlex!,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      MaterialButton(
                        color: AppColor.primarycolor,
                        textColor: AppColor.white,
                        minWidth: 200,
                        onPressed: () {
                          log("$lat");
                          log("$long");
                          context.pushPage(
                              route: AppRouter.addressesDetails,
                              extra: {
                                "lat": lat,
                                "long": long,
                              });
                        },
                        child:  Text(
                          S.of(context).complete,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
