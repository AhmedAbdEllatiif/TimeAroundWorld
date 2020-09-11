import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:world_time/services/services_utils.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  void getAllLocations() async{
    final response = await http.get('${ServiceUtils.BASE_URL}');
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    //getAllLocations();
  }


  List<WorldTime> locations = [
    WorldTime(locationUrl: 'Europe/London', locationName: 'London', flag: 'uk.png'),
    WorldTime(locationUrl: 'Europe/Berlin', locationName: 'Athens', flag: 'greece.png'),
    WorldTime(locationUrl: 'Africa/Cairo', locationName: 'Cairo', flag: 'egypt.png'),
    WorldTime(locationUrl: 'Africa/Nairobi', locationName: 'Nairobi', flag: 'kenya.png'),
    WorldTime(locationUrl: 'America/Chicago', locationName: 'Chicago', flag: 'usa.png'),
    WorldTime(locationUrl: 'America/New_York', locationName: 'New York', flag: 'usa.png'),
    WorldTime(locationUrl: 'Asia/Seoul', locationName: 'Seoul', flag: 'south_korea.png'),
    WorldTime(locationUrl: 'Asia/Jakarta', locationName: 'Jakarta', flag: 'indonesia.png'),
  ];

void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  //Navigate to home screen
  Navigator.pop(context,{
    'location': instance.locationName,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDaytime
  });
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap:(){
                  updateTime(index);
                } ,
                title: Text(
                  locations[index].locationName
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
