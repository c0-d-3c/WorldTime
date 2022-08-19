import "package:flutter/material.dart";
import "package:worldtime/services/world_time.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LocationState();
}

class _LocationState extends State<Loading> {
  void setupworldtime() async {
    worldTime instance =
        worldTime(location: 'INDIA', flag: "india.png", url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupworldtime();
  }

  // print("hello");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.orange,
            size: 100.0,
            duration: Duration(milliseconds: 1000),
          ),
        ));
  }
}
