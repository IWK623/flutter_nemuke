import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:negoto/models/user/UserModel.dart';
import 'package:platform_device_id/platform_device_id.dart';

class MainPageController {
  late FirebaseFirestore firestore;

  MainPageController() {
    firestore = FirebaseFirestore.instance;
  }

  Future<UserModel> initUser() async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    UserModel user = new UserModel(DateTime.now(), deviceId);
    var usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(deviceId).get().then((DocumentSnapshot document) {
      if (!document.exists) {
        usersRef.doc(deviceId).set(
            {'lastActiveTime': user.lastActiveTime, 'deviceId': user.deviceId});
      } else {
        usersRef.doc(deviceId).set({'lastActiveTime': DateTime.now()});
      }
    });
    return user;
  }
}
