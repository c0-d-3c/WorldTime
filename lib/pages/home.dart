import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<dynamic, dynamic>;
    print(data);
    String bgImage = data['isday']==true ? 'day.png' : 'night.png';
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'asset/$bgImage',
                  ),
              fit: BoxFit.cover,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState((){
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDay': result['isDay'],
                      'flag': result['flag']
                    };
                  });
                },
                color: Colors.amberAccent[700],
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.5,
                      color: Colors.deepOrange[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 65,
                ),
              )
            ],

          ),
        ),
      ),
    ),);
  }
}
