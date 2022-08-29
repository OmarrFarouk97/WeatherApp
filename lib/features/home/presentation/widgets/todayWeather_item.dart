import 'package:flutter/material.dart';
import 'package:weather_app/model/fiveDaysDate.dart';
import '../../../../core/blocs/apps/cubit.dart';

class TodayWeatherItem extends StatelessWidget {
  final FiveDayData item;

  const TodayWeatherItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${item.time}',
            style:Theme.of(context).textTheme.bodyText1
          ),
          SizedBox(
            height:70 ,
            width:80 ,

            child:  AppBloc.get(context).WeatherDescription(
                description:'${item.weather![0].description}'
            ),
          ),
          Text(
            '${item.temp}\u2103',
            style:
            Theme.of(context).textTheme.bodyText1
          ),
        ],
      ),
    );
  }
}