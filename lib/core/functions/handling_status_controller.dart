import 'package:e_commerce_app/core/class/status_request.dart';

StatusRequest handlingStatusRequest(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
