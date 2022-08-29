import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/presentation/widgets/todayWeather_item.dart';
import '../../../../core/blocs/apps/cubit.dart';
import '../../../../core/blocs/apps/states.dart';
import '../../../../model/fiveDaysDate.dart';
import 'nodata_widget.dart';

class TodayWeatherListView extends StatelessWidget {
  const TodayWeatherListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        List<FiveDayData> todayForecast = AppBloc.get(context)
            .fiveDaysData
            .where((element) =>
        element.dateTime == DateFormat.E().format(DateTime.now()))
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                style:Theme.of(context).textTheme.bodyText1,
                ),
                // GestureDetector(
                //   onTap: () {
                //     navigateTo(context, NextFiveDaysWidget());
                //   },
                //   child: SizedBox(width: 8),
                // ),
              ],
            ),
            SizedBox(height: 4,),
            Container(
              height: 2,
              width: double.infinity,
              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: todayForecast.isEmpty
                  ? NoDataWidget()
                  : RefreshIndicator(
                onRefresh: () async {},
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      TodayWeatherItem(item: todayForecast[index]),
                  itemCount: todayForecast.length.clamp(0, 5),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}