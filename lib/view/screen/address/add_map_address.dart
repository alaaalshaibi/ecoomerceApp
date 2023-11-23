import 'package:e_commerce_app/controller/address/address_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMapAddress extends StatelessWidget {
  const AddMapAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller = Get.put(AddressControllerImp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Address'),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MaterialButton(
          minWidth: 250,
          color: AppColor.primaryColor,
          textColor: AppColor.backgroundcolor,
          onPressed: () {
            controller.goToCompleteAddress();
          },
          child: const Text("Complete"),
        ),
        body: GetBuilder<AddressControllerImp>(builder: (controllerImp) {
          return HandlingDataView(
            statusRequest: controllerImp.statusRequest,
            widget: Column(
              children: [
                if (controllerImp.cameraPosition != null)
                  Expanded(
                    child: GoogleMap(
                      markers: controllerImp.marker.toSet(),
                      onTap: (latLang) {
                        controllerImp.addMarker(latLang);
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: controllerImp.cameraPosition!,
                      onMapCreated: (GoogleMapController controller) {
                        if (!controllerImp.controllerMap.isCompleted) {
                          controllerImp.controllerMap.complete(controller);
                        } else {}
                        // controllerImp.controllerMap.complete(controller);
                      },
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
