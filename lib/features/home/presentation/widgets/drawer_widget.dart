import 'package:flutter/material.dart';
import 'package:weather_app/core/blocs/apps/cubit.dart';

import 'OtherLocationsListViewOfDrawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String favLocation = AppBloc.get(context).favLocation;
    return Drawer(
      backgroundColor: AppBloc.get(context).isDark ?Color(0xff161c2a): Colors.white70,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics:BouncingScrollPhysics() ,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.settings,
                    color:  AppBloc.get(context).isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color:AppBloc.get(context).isDark ? Colors.white : Colors.black,

                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Favourite city',
                          style:Theme.of(context).textTheme.bodyText1
                        ),
                      ],
                    ),
                    Icon(
                      Icons.info_outline,
                      color: AppBloc.get(context).isDark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Icon(
                          Icons.location_on_rounded,
                          color: AppBloc.get(context).isDark ? Colors.white : Colors.black,
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          favLocation.toUpperCase(),
                          style:Theme.of(context).textTheme.bodyText1
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${(AppBloc.get(context).currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                          style: TextStyle(
                            fontSize: 20,
                            color:  AppBloc.get(context).isDark ? Colors.white : Colors.black,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.5,
                  color: AppBloc.get(context).isDark ? Colors.white : Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_location_outlined,
                          color:AppBloc.get(context).isDark ? Colors.white : Colors.black,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Other countries',
                          style: Theme.of(context).textTheme.bodyText1
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                OtherLocationsListViewOfDrawer(),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 0.5,
                  color: AppBloc.get(context).isDark ? Colors.white : Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
            SizedBox(height: 120,),
                //Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.report_outlined,
                      color:AppBloc.get(context).isDark ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Report wrong location',
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.headphones_outlined,
                      color: AppBloc.get(context).isDark ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Contact us',
                      style:  Theme.of(context).textTheme.bodyText1
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}