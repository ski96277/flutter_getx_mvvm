import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resono/core/domain/constants/api_const.dart';
import 'package:resono/data/impl/userInformation.dart';
import 'package:resono/data/network/AuthApiService.dart';
import 'package:resono/model/UsersModel.dart';

class UsersRepo{
  AuthApiService baseApiService = UserInformation();

  Future<Users> fetchUserData() async {
    try{
      dynamic responseData  = await baseApiService.getUserInformation(ApiConstant.ENDPOINT_USERS);
      log("message 2 = ");

      return responseData = Users.fromJson(responseData.data);

    }catch(e){
      log("message 2 error = ${e}");

      throw e;
    }
  }

}