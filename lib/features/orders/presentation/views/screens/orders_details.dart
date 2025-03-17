import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/constant/imageassets.dart';
import '../../../../../core/shared/failure_widget.dart';
import '../../../../address/presentation/view/widgets/custom_loading_widget.dart';
import '../../manager/order_details_cubit/order_details_cubit.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late Completer<GoogleMapController> _controller;
  Position? position;
  static CameraPosition? _kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;
  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.orderModel.addressLat!.toDouble(),
          widget.orderModel.addressLong!.toDouble()),
      zoom: 14.4746,
    );
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(widget.orderModel.addressLat!.toDouble(),
            widget.orderModel.addressLong!.toDouble())));
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
    BlocProvider.of<OrderDetailsCubit>(context)
        .fetchOrderDetails(orderId: widget.orderModel.ordersId!);
    _controller = Completer<GoogleMapController>();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state is OrderDetailsLoading) {
            return const CustomLoadingWidget();
          } else if (state is OrderDetailsSuccess) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(children: [
                          Table(
                            children: [
                              const TableRow(
                                children: [
                                  Text("Item",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primarycolor),
                                      textAlign: TextAlign.center),
                                  Text("QTY",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primarycolor),
                                      textAlign: TextAlign.center),
                                  Text("Price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primarycolor),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              ...List.generate(
                                state.orderDetails.length,
                                (index) => TableRow(
                                  children: [
                                    Text(state.orderDetails[index].itemsName!,
                                        textAlign: TextAlign.center),
                                    Text(
                                        state.orderDetails[index].itemsCount
                                            .toString(),
                                        textAlign: TextAlign.center),
                                    Text(
                                        state.orderDetails[index].itemsprice
                                            .toString(),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Divider(height: 20),
                          Text(
                              "TotalPrice :${widget.orderModel.ordersTotalprice}\$",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primarycolor),
                              textAlign: TextAlign.center),
                        ]),
                      ),
                    ),
                    widget.orderModel.ordersType == 0
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 5, top: 5),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ListTile(
                                  title: const Text(
                                    "Shipping Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primarycolor),
                                  ),
                                  subtitle: Text(
                                      "${widget.orderModel.addressCity} ${widget.orderModel.addressStreet}"),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    widget.orderModel.ordersType == 0
                        ? Card(
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: _kGooglePlex == null
                                      ? const CustomLoadingWidget()
                                      : GoogleMap(
                                          mapType: MapType.normal,
                                          markers: markers.toSet(),
                                          onTap: (LatLng latLng) {
                                            addMarkers(latLng);
                                          },
                                          initialCameraPosition: _kGooglePlex!,
                                          onMapCreated:
                                              (GoogleMapController controller) {
                                            _controller.complete(controller);
                                          },
                                        ),
                                )))
                        : Container(),
                  ],
                ));
          } else if (state is OrderDetailsServerFailure) {
            log(state.errMessage.toString());
            return FailureWidget(
              onPressed: () {},
              image: AppImageAsset.server,
            );
          } else if (state is OrderDetailsNetworkFailure) {
            return FailureWidget(
              onPressed: () {},
              image: AppImageAsset.internet,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
