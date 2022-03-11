import 'package:platform_device_id/platform_device_id.dart';

class UserModel {
  DateTime? lastActiveTime;
  String? deviceId;
  UserModel(this.lastActiveTime, this.deviceId);

  Future<void> userSetup() async {
    this.deviceId = await PlatformDeviceId.getDeviceId;
    this.lastActiveTime = DateTime.now();
  }

  void userUpdateActiveTime() {
    this.lastActiveTime = DateTime.now();
  }
}
