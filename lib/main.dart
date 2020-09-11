import 'package:flutter/material.dart';
import 'package:world_time/app_utils.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: AppUtils.LOADING_ROUTE,
    routes:{
      AppUtils.LOADING_ROUTE: (context) => Loading(),
      AppUtils.HOME_ROUTE: (context) => Home(),
      AppUtils.LOCATION_ROUTE: (context) => ChooseLocation(),
    },
  ));





}


