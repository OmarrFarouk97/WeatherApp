abstract class AppStates{}

class AppInitialState extends AppStates{}

class getCurrentWeatherDataOnSuccess extends AppStates{}
class getCurrentWeatherDataOnError extends AppStates{}


class updateWeatherData extends AppStates{}


class getCurrentWeatherDataOnSuccessOnFiveDays extends AppStates{}
class getCurrentWeatherDataOnErrorOnFiveDays  extends AppStates{}


class getCurrentWeatherDataOnSuccessOnTopCities extends AppStates{}
class getCurrentWeatherDataOnErrorOnTopCities  extends AppStates{}




class AppChangeAppMode  extends AppStates{}



class FavLocationChangeState  extends AppStates{}