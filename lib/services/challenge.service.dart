import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rideal/enviroment/enviroment.dart';
import 'package:rideal/models/challenge-pack.dart';
import 'package:rideal/models/challenge.dart';
import 'package:rideal/models/city.dart';
import 'package:rideal/services/sign_in_up.service.dart';

class ChallengeService {
  final authService = SignInUpService();
  final location = Location();

  Future<List<ChallengePack>> getAllChallengs() async {
    try {
      final currentUser = await this.authService.currentUser;
      final headers = this.authService.getAuthHeaders(currentUser);

      Response response  = await Dio(BaseOptions(headers: headers))
      .get(Enviroment.apiBaseUrl + Enviroment.challengUrl + "/running");

      if (response.statusCode != 200) {
        print(response);
      }

      final responseBody = response.data;
      //print(responseBody);
      return responseBody
              .map<ChallengePack>((l) => ChallengePack.fromJson(l))
              .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

}
