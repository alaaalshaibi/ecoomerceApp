import 'dart:io';

checkInternet() async {
  try {
    var checkResult = await InternetAddress.lookup('google.com');
    if (checkResult.isNotEmpty && checkResult[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
