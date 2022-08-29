import 'package:flutter/material.dart';

import '../../../../core/blocs/apps/cubit.dart';
import '../../../../model/currnetWeatherData.dart';

class CityItem extends StatelessWidget {
  final CurrentWeatherData item;
  const CityItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${item.name}',
                    style:
                    Theme.of(context).textTheme.bodyText1
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: 25,
                    width: 25,
                    child:
                    AppBloc.get(context).WeatherDescription(description:'${item.weather![0].description}')
                ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${(item.main!.temp! - 273.15).round().toString()}\u2103',
                    style:Theme.of(context).textTheme.bodyText1

                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}