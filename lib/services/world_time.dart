import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;// location name for ui
  String time; // time in location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location,this.flag,this.url});

  // Future <void> Means void will be return after async finish running
  Future <void> getTime() async {
    try{

//Three////////////////////////////
    // make request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
//    print(data);
    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
//    print(datetime);
//    print(offset);
    // create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }

//////////////////////////////////////
    catch (e) {
      print(e);
      time = 'could not get time';
    }
  }

}

