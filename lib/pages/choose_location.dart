import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag :'nigeria.png'),
    WorldTime(url: 'Europe/Amsterdam', location: 'Netherlands', flag :'netherlands.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Australia', flag :'australia.png'),
    WorldTime(url: 'Asia/Karachi', location: 'Pakistan', flag :'Pakistan.png'),
    WorldTime(url: 'Asia/Kabul', location: 'Afganistan', flag :'afganistan.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Nepal', flag :'nepal.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag :'India.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Japan', flag :'Japan.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag :'singapore.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'China', flag :'China.png'),
    WorldTime(url: 'Atlantic/Canary', location: 'Spain', flag :'spain.png'),
    WorldTime(url: 'Europe/Paris', location: 'France', flag :'france.png'),
    WorldTime(url: 'Europe/Rome', location: 'Italy', flag :'Italy.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Russia', flag :'russia.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Turkey', flag :'turkey.png'),
    WorldTime(url: 'Europe/Luxembourg', location: 'Luxembourg', flag :'luxenbourg.png'),
    WorldTime(url: 'Asia/Nicosia', location: 'Cyprus', flag :'cyprus.png'),
    WorldTime(url: 'America/New_York', location: 'USA', flag :'US.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico', flag :'mexico.jpg'),
    WorldTime(url: 'America/Toronto', location: 'Canada', flag :'canada.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Thailand', flag :'Thailand.png'),
  ];
  
  void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Choose location'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ) ,
              )
            ),
          );
        },
      ),
    );
  }
}
