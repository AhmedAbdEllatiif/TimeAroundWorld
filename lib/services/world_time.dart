import 'package:http/http.dart'as http;
import 'dart:convert' as convert;
import 'package:world_time/Models/location_time.dart';
import 'package:world_time/services/services_utils.dart';
import 'package:intl/intl.dart';

class WorldTime{


  String locationName; //location name for UI
  String time; //the time in that location
  String flag; //URL to an asset flag icon
  String locationUrl; //Location endpoint for location url
  bool isDaytime;
  WorldTime({this.locationName, this.flag, this.locationUrl});




  Future<void> getTime() async{

    final response = await http.get('${ServiceUtils.BASE_URL}$locationUrl');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      LocationTime locationTime =LocationTime.fromJson(convert.json.decode(response.body));
      String dateTime = locationTime.datetime;
      //String offset = locationTime.utcOffset; //+01:00
      String offset = locationTime.utcOffset.substring(1,3); //+01:00
      String offset2 = locationTime.utcOffset.substring(4,6);
      //print(offset);

      //Create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));

      //set the time
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);



    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }

}

WorldTime _worldTime = WorldTime(locationName:'Berlin', flag:'', locationUrl:'Europe/Berlin');
