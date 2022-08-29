import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/blocs/apps/cubit.dart';
import 'core/blocs/apps/states.dart';
import 'core/constants/bloc_observer.dart';
import 'core/constants/thems.dart';
import 'core/data/local/shared_preferences.dart';
import 'features/splash/presentaion/page/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  BlocOverrides.runZoned(
        () {
      bool? isDark = CacheHelper.getData(key: 'isDark');
      String? favLocation = CacheHelper.getFavLocation(key: 'favLocation');

      runApp(MyApp(
        isDark: isDark,
          favLocation: favLocation
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  bool? isDark;
  final String? favLocation;

  MyApp({ this.isDark,this.favLocation});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context)=> AppBloc(city: "cairo")
            ..getCurrentWeatherData()
            ..getFiveDaysForecastData()
            ..getTopFiveCities()
        ..changeAppMode(fromShared: isDark)
        ..changeFavLocation(fromShared: favLocation),
      child: BlocConsumer <AppBloc, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode:
                // ThemeMode.light,
                AppBloc.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                home: const SplashPage()
            );
          }
      )
    );
  }
}