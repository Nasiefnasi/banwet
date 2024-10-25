import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/service/auth/attentence_marking.dart';

class AttendanceMarkingController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController landmarkController = TextEditingController();
  var storage = GetStorage();

  var previousIndex;
  RxBool isTrue = true.obs;
  var selectedIndex = 0.obs;
  var selectedIndex1 = 0.obs;
  String? address;

  // RxBool isTruee = true.obs;
  late AnimationController idleAnimation;
  late AnimationController idleAnimation1;
  late AnimationController onSelectedAnimation;
  late AnimationController onSelectedAnimation1;
  late AnimationController onChangedAnimation;
  late AnimationController onChangedAnimation1;
  var isLoading = false.obs;
  Duration animationDuration = const Duration(milliseconds: 700);
  Duration animationDuration1 = const Duration(milliseconds: 700);
  @override
  void onInit() {
    determinePosition();
    super.onInit();
    idleAnimation = AnimationController(vsync: this);
    idleAnimation1 = AnimationController(vsync: this);
    onSelectedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
    onSelectedAnimation1 =
        AnimationController(vsync: this, duration: animationDuration1);
    onChangedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
    onChangedAnimation1 =
        AnimationController(vsync: this, duration: animationDuration1);
  }

  ///<--------------   location permition function----->
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    //loo=placemarks.va
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  Future<bool> attendancePost(
      {required String userId,
      required String attendance,
      required String address,
      required String landmark,
      required String latitude,
      required String longitude}) async {
    isLoading.value = true;
    update();
    var result = await AttendenceMarkingService().addAttentence(
        attendance, address, landmark, latitude, longitude, address, userId);

    if (result.status) {
      storage.write('address', address);
      print(address);
      // storage.write('atte', true);
      storage.write('atte', 1);
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      update();
    }

    return result.status;
  }

  @override
  void dispose() {
    super.onClose();
    super.dispose();
    idleAnimation.dispose();
    idleAnimation1.dispose();
    onSelectedAnimation.dispose();
    onSelectedAnimation1.dispose();
    onChangedAnimation.dispose();
    onChangedAnimation1.dispose();
  }
}
