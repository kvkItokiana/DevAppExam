import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testdeux/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime( location :'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
      return Home(instance.location, instance.time, instance.flag, instance.isDayTime);}));

  }

  @override
  void initState() {
    super.initState();
    //setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
