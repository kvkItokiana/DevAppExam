import 'package:flutter/material.dart';
import 'package:testdeux/services/world_time.dart';

import 'home.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}



class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime( location: 'Berlin', flag: 'allm.png', url: 'Europe/Berlin'),
    WorldTime( location: 'Madrid', flag: 'spain.png', url: 'Europe/Madrid',),
    WorldTime( location: 'Paris', flag: 'fr.png', url: 'Europe/Paris'),
    WorldTime( location: 'London', flag: 'uk.png', url: 'Europe/London'),
  ];

  void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context){
        return Home(instance.location, instance.time, instance.flag, instance.isDayTime);}));



  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[900],
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: const Text('Choisie un endroit'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length ,
        itemBuilder: (context, index){
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
              child: ListTile(
                 onTap: (){
                   updateTime(index);
                 },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
          );
        }
      ),
    );
  }
}
