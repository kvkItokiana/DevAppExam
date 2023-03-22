import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location ;
  String? time;
  String flag ;
  String url ;
  bool isDayTime  = true ;

  WorldTime({ required this.location, required this.flag,required this.url});

  Future<void> getTime() async {

    try{

      Uri lien = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      // requete du temps
      Response response = await get(lien);
      Map data = jsonDecode(response.body);

      //les propriétés des  datas
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3) ;

      DateTime now = DateTime.parse(datetime);
      now.add(Duration( hours: int.parse(offset) ));

      isDayTime = now.hour> 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
      print("ok : $location : $url");
    } catch (e) {
      print('"$location : $url" caught error: ${e.toString()}');
      time = 'could not get time data';
    }

  }

}
