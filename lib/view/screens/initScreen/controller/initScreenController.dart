import 'dart:developer';

import 'package:get/get.dart';
import 'package:resono/data/model/UsersModel.dart';
import 'package:resono/data/repository/UsersRepo.dart';
import 'package:resono/services/response/api_response.dart';

class InitScreenController extends GetxController {

  final _usersRepo = UsersRepo();
  ApiResponse<Users>? users;


  @override
  void onInit() {
    super.onInit();
    // callUsersData();
  }

  setUsersData(ApiResponse<Users> response) {
    users = response;
    update();
  }

  void callUsersData() async {
    setUsersData(ApiResponse.loading());
    _usersRepo.fetchUserData().then((users) {
      log("message 0 = ${users.toJson()}");

      setUsersData(ApiResponse.completed(users));

      log("message = ${this.users?.status}");
    }).onError((error, stackTrace) {
      log("message 1= ${users?.status}");
      log("message 1= ${error.toString()}");

      ApiResponse.error(error.toString());
    });
  }
}
