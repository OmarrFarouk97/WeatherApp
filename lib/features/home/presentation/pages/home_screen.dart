import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/constants/componat.dart';
import '../../../../core/blocs/apps/cubit.dart';
import '../../../../core/blocs/apps/states.dart';
import '../widgets/5daysforecast_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/ListOfOtherCountries.dart';
import '../widgets/today_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppBloc.get(context).isDark ?Color(0xff161c2a): Colors.transparent,
            drawer: DrawerWidget(),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 1400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            AppBloc.get(context).isDark ?
                              Colors.black54: Colors.white
                              , BlendMode.darken),
                          image: AssetImage(
                            AppBloc.get(context).isDark
                             ?'assets/images/starry-night-sky.jpg':'assets/images/cloud-in-blue-sky.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      AppBloc.get(context).changeAppMode();
                                    },
                                    icon: Icon(Icons.brightness_4_outlined)),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 110, left: 20, right: 20),
                            child: TextField(
                              controller: AppBloc.get(context).nameCity,
                              onChanged: (value) =>
                                  AppBloc.get(context).city = value,
                              style: TextStyle(
                                color: AppBloc.get(context).isDark ? Colors.white : Colors.black45,
                                //Colors.white,
                              ),
                              textInputAction: TextInputAction.search,
                              onSubmitted: (value) =>
                                  AppBloc.get(context).updateWeather(),
                              decoration: InputDecoration(
                                suffix: Icon(
                                  Icons.search,
                                  color:AppBloc.get(context).isDark ? Colors.white : Colors.black,
                                ),
                                hintStyle: TextStyle(
                                  color:
                                AppBloc.get(context).isDark ? Colors.white : Colors.black,
                                ),
                                hintText: 'Search'.toUpperCase(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color:AppBloc.get(context).isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:
                                  AppBloc.get(context).isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:
                                  AppBloc.get(context).isDark ? Colors.white : Colors.black,
                                     ),
                                ),
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment(0.0, 1.46),
                          //   child: SizedBox(
                          //     height: 10,
                          //     width: 10,
                          //     child: OverflowBox(
                          //       maxWidth: MediaQuery.of(context).size.width,
                          //       maxHeight:
                          //           (MediaQuery.of(context).size.height / 3),
                          //       child: Stack(
                          //         children: <Widget>[
                          //           Container(
                          //             padding:
                          //                 EdgeInsets.symmetric(horizontal: 15),
                          //             width: 420,
                          //             child: Card(
                          //               color: AppBloc.get(context).isDark ? Color(0xff1c2536) : Colors.white,
                          //               elevation: 5,
                          //               shape: RoundedRectangleBorder(
                          //                 side: BorderSide(
                          //                   width: 2,
                          //                     color: AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(25),
                          //               ),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.center,
                          //                 children: <Widget>[
                          //                   Container(
                          //                     padding: EdgeInsets.only(
                          //                         top: 10, left: 15, right: 15),
                          //                     child: Column(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                       children: <Widget>[
                          //                         Center(
                          //                           child: Text(
                          //                             '${AppBloc.get(context).currentWeatherData.name}'
                          //                                 .toCapitalized(),
                          //                             style: Theme.of(context).textTheme.bodyText1
                          //                           ),
                          //                         ),
                          //                         Center(
                          //                           child: Text(
                          //                             DateFormat()
                          //                                 .add_MMMMEEEEd()
                          //                                 .format(
                          //                                     DateTime.now()),
                          //                             style:
                          //                             Theme.of(context).textTheme.bodyText1
                          //
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   SizedBox(height: 10),
                          //                   Padding(
                          //                     padding: const EdgeInsets.symmetric(horizontal: 11),
                          //                     child: Container(
                          //                       height: 2,
                          //                       width: double.infinity,
                          //                       color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.all(8.0),
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: <Widget>[
                          //                         Container(
                          //                           child: Column(
                          //                             children: <Widget>[
                          //                               SizedBox(height: 20),
                          //                               Text(
                          //                                 '${AppBloc.get(context).currentWeatherData.weather![0].description!.toCapitalized()}',
                          //                                 style:
                          //                                 Theme.of(context).textTheme.headline5,
                          //                                 maxLines: 1,
                          //                                 overflow: TextOverflow.ellipsis,
                          //                               ),
                          //                               SizedBox(height: 20),
                          //                               Text(
                          //                                 '${(AppBloc.get(context).currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                          //                                 style:
                          //                                 Theme.of(context).textTheme.headline5
                          //                               ),
                          //                               SizedBox(height: 15),
                          //                               Text(
                          //                                 'min: ${(AppBloc.get(context).currentWeatherData.main!.temp_min! - 273.15).round().toString()}\u2103 / max: ${(AppBloc.get(context).currentWeatherData.main!.temp_max! - 273.15).round().toString()}\u2103',
                          //                                 style:
                          //                                 Theme.of(context).textTheme.bodyText1
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         Container(
                          //                           child: Column(
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .center,
                          //                             children: <Widget>[
                          //                               SizedBox(
                          //                                 width: 110,
                          //                                 height: 110,
                          //                                 child:
                          //                                 AppBloc.get(context).WeatherDescription(description:AppBloc.get(context).currentWeatherData.weather![0].description )
                          //                               ),
                          //                               Container(
                          //                                 child: Text(
                          //                                   'wind ${AppBloc.get(context).currentWeatherData.wind!.speed} m/s',
                          //                                   style:
                          //                                     Theme.of(context).textTheme.bodyText1
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.only(top: 210),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(

                                    width: 420,
                                    height: 240 ,
                                    child: Card(
                                      color: Colors.transparent,
                                      //AppBloc.get(context).isDark ? Color(0xff1c2536) : Colors.white,
                                      //elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 2,
                                            color: AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 15, right: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                      '${AppBloc.get(context).currentWeatherData.name}'
                                                          .toCapitalized(),
                                                      style: Theme.of(context).textTheme.bodyText1
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                      DateFormat()
                                                          .add_MMMMEEEEd()
                                                          .format(
                                                          DateTime.now()),
                                                      style:
                                                      Theme.of(context).textTheme.bodyText1

                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 11),
                                            child: Container(
                                              height: 2,
                                              width: double.infinity,
                                              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      SizedBox(height: 20),
                                                      Text(
                                                        '${AppBloc.get(context).currentWeatherData.weather![0].description!.toCapitalized()}',
                                                        style:
                                                        Theme.of(context).textTheme.headline5,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text(
                                                          '${(AppBloc.get(context).currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                          style:
                                                          Theme.of(context).textTheme.headline5
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(
                                                          'min: ${(AppBloc.get(context).currentWeatherData.main!.temp_min! - 273.15).round().toString()}\u2103 / max: ${(AppBloc.get(context).currentWeatherData.main!.temp_max! - 273.15).round().toString()}\u2103',
                                                          style:
                                                          Theme.of(context).textTheme.bodyText1
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      SizedBox(
                                                          width: 110,
                                                          height: 110,
                                                          child:
                                                          AppBloc.get(context).WeatherDescription(description:AppBloc.get(context).currentWeatherData.weather![0].description )
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            'wind ${AppBloc.get(context).currentWeatherData.wind!.speed} m/s',
                                                            style:
                                                            Theme.of(context).textTheme.bodyText1
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 30,),
                                  Container(
                                      width:double.infinity ,
                                      height: 240,
                                      child: Card(
                                          color: Colors.transparent,
                                         // AppBloc.get(context).isDark ? Color(0xff1c2536) : Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 2,
                                                color: AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
                                            ),
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: TodayWeatherListView(),
                                      )
                                  )
                                  ),
                                  SizedBox(height: 20,),
                                  fiveDayForecast(),
                                  SizedBox(height: 20,),
                                  Container(
                                    width:double.infinity ,
                                    height: 240,
                                    child: Card(
                                      color:Colors.transparent,
                                      //AppBloc.get(context).isDark ? Color(0xff1c2536) : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 2,
                                            color: AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                  'Other countries',
                                                  style:
                                                  Theme.of(context).textTheme.bodyText1
                                              ),
                                            ),
                                            //SizedBox(height: 4,),
                                            Divider(
                                              color:AppBloc.get(context).isDark?  Colors.blueGrey : Color(0xff5C488BFF),
                                              thickness: 2,
                                            ),
                                           // SizedBox(height: 5,),
                                            ListOfOtherCountries(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}


