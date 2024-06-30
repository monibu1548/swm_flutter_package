import 'package:flutter_package_sample/services/user_service.dart';
import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/services/push_notification_service.dart';
import 'dart:async';

class RootModel {
  final UserService userService;
  final FPPushNotificationService pushNotificationService;

  RootModel(this.userService, this.pushNotificationService);

  Stream<FPUser?> getUserStream() {
    return userService.getUserStream().transform(StreamTransformer.fromHandlers(
      handleData: (FPUser? user, EventSink<FPUser?> sink) {
        if (user != null) {
          initPushNotification();
        }
        sink.add(user);
      },
    ));
  }

  bool isSignedIn() {
    return userService.isSignedIn();
  }

  void initPushNotification() {
    pushNotificationService.initializeNotification(updatedTokenHandler: (fcmToken) async {
      if (fcmToken != null) {
        await userService.upsertFCMToken(fcmToken: fcmToken);
      }
    });
  }

  Future<bool?> hasPermission() async {
    return await pushNotificationService.hasPermission();
  }
}