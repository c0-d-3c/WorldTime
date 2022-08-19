import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class worldTime{
    String location;
    late String  time;
    String flag;
    String url;
    bool isDay = true;

    worldTime({ required this.location, required this.flag, required this.url});

    Future<void> getTime() async {
      try {
        Response response = await get(
            Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);
        // print(data);

        String datetime = data['utc_datetime'];
        String offset = data['utc_offset'];
        String h = offset.substring(1, 3);
        String m = offset.substring(4, 6);
        // print(datetime);
        // print(offset);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(h), minutes: int.parse(m)));
        int hh = now.hour;
        print("NOW: $hh");
        isDay = (now.hour>=6 && now.hour<18) ? true: false ;
        time = DateFormat.jm().format(now);
      }
      catch(e){
        print("MUNCH: $e");
        time  =  "NULL";
        isDay = true;
      }
    }

}







// print("sdoafjlkda");

