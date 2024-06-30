import 'package:flutter/material.dart';
import 'package:flutter_package_sample/services/user_service.dart';
import 'package:flutter_package_sample/views/home/home_model.dart';
import 'package:swm_flutter_package/services/push_notification_service.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeModel _model;

  String pushNotificationStatusText = '';

  HomeViewModel() : _model = HomeModel(UserService(), FPPushNotificationService()) {
    updatePushNotificationStatusText();
  }

  String userID() {
    return _model.user()?.id ?? '-';
  }

  Future<void> signOut() async {
    return await _model.signOut();
  }

  Future<void> requestPermission() async {
    await _model.requestPermission();
    updatePushNotificationStatusText();
  }

  void updatePushNotificationStatusText() async {
    var hasPermission = await _model.hasPermission();
    if (hasPermission == null) {
      pushNotificationStatusText = '알림 권한을 요청해주세요.';
    } else if (hasPermission == true) {
      pushNotificationStatusText = '알림 권한이 허용되었습니다.';
    } else {
      pushNotificationStatusText = '알림 권한이 거부되었습니다.';
    }
    notifyListeners();
  }
}