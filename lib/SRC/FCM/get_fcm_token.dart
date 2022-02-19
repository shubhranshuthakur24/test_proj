import 'package:firebase_messaging/firebase_messaging.dart';

import 'constants.dart';

class GetFcmToken {
  static Future<String?> getFcmToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    showToast(fcmToken.toString());
    return fcmToken;
  }
}
