import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/blocs/apps/states.dart';

import '../../../model/currnetWeatherData.dart';
import '../../../model/fiveDaysDate.dart';
import '../../constants/images.dart';
import '../../data/local/shared_preferences.dart';
import '../../data/webservices/weather_services.dart';

class AppBloc extends Cubit<AppStates> {

  AppBloc({ this.city}) : super(AppInitialState());

  static AppBloc get (context)=> BlocProvider.of<AppBloc>(context);


  String? city;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  var nameCity = TextEditingController() ;


  void updateWeather() async{

    getCurrentWeatherData();
    getFiveDaysForecastData();

    nameCity.clear();
    emit(updateWeatherData());
  }



  void getCurrentWeatherData() async {
    WeatherService(city:await '$city').getCurrentWeatherData(

        onSuccess: (data) {

          currentWeatherData = data;
          emit(getCurrentWeatherDataOnSuccess());
        },
        onError: (error) => {
          print(error),
        emit(getCurrentWeatherDataOnError())
        }
        );
  }


  void getFiveDaysForecastData() async{
    WeatherService(city:await '$city').getFiveDaysThreeHoursForecastData(
        onSuccess: (data) {
          fiveDaysData =  data;
          emit(getCurrentWeatherDataOnSuccessOnFiveDays());
        }, onError: (error) {
      print(error);
      emit(getCurrentWeatherDataOnErrorOnFiveDays());
    });
  }



  void getTopFiveCities() {
    List<String> cities = [
      'paris',
      'England',
      'belgium',
      'Brazil',
      'Italy'
    ];
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        emit(getCurrentWeatherDataOnSuccessOnTopCities());
      }, onError: (error) {
        print(error);
        emit(getCurrentWeatherDataOnErrorOnTopCities());
      });
    });
  }


  bool isDark= false;
  void changeAppMode({ bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeAppMode());
      });
    }
  }


  StatefulWidget?  WeatherDescription   ({
   required String? description
  })
  {
    if (description == "clear sky")
      return
        LottieBuilder.asset(Images.cloudyAnim,width: 120,
            height: 120);

    else if (description == 'broken clouds')
    return
      Image(image: AssetImage('assets/images/cloudy.png'),
        width:120 ,
        height:120 ,
      );
      // Image(image: AssetImage('assets/images/clear-sky.png'),

    // width:120 ,
    //     height:120 ,

      else if (description == 'scattered clouds')
        return

       Image(image: AssetImage('assets/images/rain.png'),
         width:120 ,
         height:120 ,
       );

      else if (description == 'few clouds')
        return

       Image(image: AssetImage('assets/images/few clouds.png'),
         width:120 ,
         height:120 ,
       );

    else if (description == 'overcast clouds')
      return

        Image(image: AssetImage('assets/images/overcast clouds.png'),
          width:120 ,
          height:120 ,
        );
    else return Image(image: AssetImage('assets/images/other.png'),
        width:120 ,
        height:120 ,
      );

  }



  String favLocation = 'maadi';
  void changeFavLocation({String? fromShared}) {
    if (fromShared != null) {
      favLocation = fromShared;
      emit(FavLocationChangeState());
    } else {
      favLocation = city!;
      CacheHelper.setFavLocation(key: "favLocation", value: favLocation)
          .then((value) {
        emit(FavLocationChangeState());
      });
    }
  }


}