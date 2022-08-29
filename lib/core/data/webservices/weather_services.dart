import '../../../model/currnetWeatherData.dart';
import '../../../model/fiveDaysDate.dart';
import '../repositories/reponse.dart';

class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=f863e01b59197ed30977865a7956ba82';


  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    final url =await '$baseUrl/weather?q=$city&lang=en&$apiKey';
    ApiRepo(
      url: url,
    ).get(beforeSend: () => {
          if (beforeSend != null)
            {
              beforeSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess!(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForecastData({
    Function()? beforeSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) async {

    final url = await '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepo(
      url:url,
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              .map((t) => FiveDayData.fromJson(t))
              .toList())
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }
}