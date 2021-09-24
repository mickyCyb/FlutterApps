import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      // print(response.body);
      Map data = jsonDecode(response.body);
      // print(data['utc_offset']);
      // print(data['datetime']);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));  // ?? for positive signs only

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time = 'could not load data';
    }

  }

}