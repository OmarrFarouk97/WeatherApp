import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/blocs/apps/cubit.dart';
import '../../../../core/blocs/apps/states.dart';
import '../../../../core/constants/images.dart';
import '../../../../model/currnetWeatherData.dart';


class ListOfOtherCountries extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
      return Container(
        height: 155,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: AppBloc.get(context).dataList.length,
          itemBuilder: (context, index) {
            CurrentWeatherData? data;
            (AppBloc.get(context).dataList.length > 0)
                ? data = AppBloc.get(context).dataList[index]
                : data = null;
            return Container(
              width: 160,
              height: 150,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                semanticContainer: true,
                borderOnForeground: true,
                //elevation: 3,
                color:Colors.transparent,
                //AppBloc.get(context).isDark ?Color(0xff1c2536): Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: AppBloc.get(context).isDark?Colors.blueGrey :Color(0xff5C488BFF)
                  ),

                 borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                            '${data!.name}',
                        style:
                        Theme.of(context).textTheme.bodyText1
                      ),
                      Text(
                            '${(data.main!.temp !- 273.15).round().toString()}\u2103',
                        style:
                        Theme.of(context).textTheme.bodyText1
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child:
                        AppBloc.get(context).WeatherDescription(
                            description:'${data.weather![0].description}'
                        )


                      ),
                      Text(
                            '${data.weather![0].description}',
                        style:
                        Theme.of(context).textTheme.bodyText1,maxLines: 1,overflow: TextOverflow.ellipsis

                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
      },
    );
  }
}