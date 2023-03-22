import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  String? location ;
  String? time;
  String? flag ;
  bool? url ;

  Home(this.location, this.time, this.flag, this.url);
  @override
  _HomeState createState() => _HomeState(this.location, this.time, this.flag, this.url);
}

class _HomeState extends State<Home> {
  String? location ;
  String? time;
  String? flag ;
  bool? isDayTime ;
  _HomeState(this.location, this.time, this.flag, this.isDayTime);
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {

      data['isDayTime'] = isDayTime;
      data['location'] = location;
      data['flag'] = flag;
      data['time'] = time;

    String bgImage = data['isDayTime']  ? 'jours.jpg' : 'nuit.jpg';
    Color bgColor = data['isDayTime']  ? Colors.blue : Colors.indigo;

    return Scaffold(
    backgroundColor: bgColor,
    body : SafeArea(
      child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child : Column(
              children: <Widget> [
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/location');
                    /*
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });

                     */
                    },
                    icon: const Icon(
                        Icons.edit_location,
                        color: Colors.grey,
                    ),
                    label: Text(
                        'Choisissez votre localisation',
                        style: TextStyle(
                          color : Colors.grey[300],
                        ),
                    ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      data['location'],
                      style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing : 2.0,
                      color: Colors.white,
                      )
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
                ],
          )
         ),
      ),
      )
    );
  }
}
