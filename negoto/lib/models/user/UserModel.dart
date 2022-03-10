import 'dart:html';

import 'package:platform_device_id/platform_device_id.dart';

class UserModel {
  DateTime last_active_time;
  String? deviceId;
  UserModel(this.last_active_time, this.deviceId);

  Future<void> userSetup() async {
    this.deviceId = await PlatformDeviceId.getDeviceId;
    this.last_active_time = DateTime.now();
  }

  void userUpdateActiveTime() {
    this.last_active_time = DateTime.now();
  }
}
