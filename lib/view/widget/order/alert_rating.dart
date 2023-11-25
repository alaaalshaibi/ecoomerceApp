import 'package:e_commerce_app/controller/orders/orders_archive_controller.dart';
import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: true,
    // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: SvgPicture.asset(
        AppImageAssets.logo1,
        height: 100,
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () {},
      onSubmitted: (response) {
        OrderArchiveControllerImp controller = Get.find();
        controller.sendRating(
            orderId: orderId,
            rating: response.rating.toString(),
            noteRating: response.comment);
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          // _rateAndReviewApp();
        }
      },
    ),
  );
}
