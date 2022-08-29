import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

class FiveDayData {
  final String? dateTime;
  final int? temp;
  final String? time;
  final List<Weather>? weather;


  FiveDayData( {this.dateTime, this.time,this.temp,this.weather,});

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }

    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    String dtTxt = json['dt_txt'];
    DateTime dt = DateTime.parse(dtTxt);
    DateTime t = DateTime.parse(dtTxt);
    // HOUR_MINUTE      jm
    String time = DateFormat.jm().format(t);

    String dateTime = DateFormat.E().format(dt);


    return FiveDayData(
     // dateTime: '$fandl',
      dateTime: dateTime,
      time: time,
      weather: (json['weather'] as List).map((w) => Weather.fromJson(w)).toList(),
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),

    );
  }
}