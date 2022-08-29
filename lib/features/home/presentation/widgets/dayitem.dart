import 'package:flutter/material.dart';
import '../../../../core/blocs/apps/cubit.dart';
import '../../../../model/fiveDaysDate.dart';

class DayItem extends StatelessWidget {
  final FiveDayData item;

  const DayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${item.temp}\u2103',
            style:
            Theme.of(context).textTheme.bodyText1
          ),
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child:AppBloc.get(context).WeatherDescription(description:'${item.weather![0].description}')
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '${item.time}',
            style:Theme.of(context).textTheme.bodyText1

          ),
        ],
      ),
    );
  }
}