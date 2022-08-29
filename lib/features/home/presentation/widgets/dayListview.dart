import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/blocs/apps/cubit.dart';
import '../../../../model/fiveDaysDate.dart';
import 'dayitem.dart';
import 'nodata_widget.dart';

class DayListView extends StatelessWidget {
  final Duration duration;
  const DayListView({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FiveDayData> dayForecast = AppBloc.get(context)
        .fiveDaysData
        .where((element) =>
    element.dateTime ==
        DateFormat.E().format(DateTime.now().add(duration)))
        .toList();
    return SizedBox(
      width: double.infinity,
      height:40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('EEEE').format(
              DateTime.now().add(
                duration,
              ),
            ),
            style: Theme.of(context).textTheme.bodyText1
          ),
          dayForecast.isEmpty
              ? NoDataWidget()
              : RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  DayItem(item: dayForecast[index]),
              itemCount: dayForecast.length.clamp(0, 1),
            ),
          ),
        ],
      ),
    );
  }
}