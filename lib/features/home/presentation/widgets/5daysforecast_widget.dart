import 'package:flutter/material.dart';
import '../../../../core/blocs/apps/cubit.dart';
import 'dayListview.dart';

class fiveDayForecast extends StatelessWidget {
  const fiveDayForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.transparent,
      //AppBloc.get(context).isDark ? Color(0xff1c2536) : Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            width: 2,
            color:
            AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
        ),
        borderRadius:
        BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('5-DAY FORECAST',style: Theme.of(context).textTheme.bodyText1,),
            Divider(
              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
              thickness: 2,
            ),
            SizedBox(height: 20,),
            DayListView(
              duration: Duration(days: 1),
            ),
            Divider(
              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
              thickness: 2,
            ),
            DayListView(
              duration: Duration(days: 2),
            ),
            Divider(
              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
              thickness: 2,
            ),
            DayListView(
              duration: Duration(days: 3),
            ),
            Divider(
              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
              thickness: 2,
            ),
            DayListView(
              duration: Duration(days: 4),
            ),
            Divider(
              color: AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
              thickness: 2,
            ),
            DayListView(
              duration: Duration(days: 5),
            ),
          ],
        ),
      ),
    );
  }
}
