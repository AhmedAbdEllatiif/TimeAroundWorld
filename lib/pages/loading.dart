import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

import '../app_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loading = "Loading...";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        locationName: 'Berlin', flag: '', locationUrl: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, AppUtils.HOME_ROUTE, arguments: {
      'location': instance.locationName,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
    print(instance.time);
    setState(() {
      loading = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 88.0,
          ),
        ));
  }
}
