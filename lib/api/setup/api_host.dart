class ApiHost {
  ApiHost._();

  static String get baseURL {
    return 'https://api.openweathermap.org/data/$apiVersion';
  }

  static String get apiVersion => '2.5';

  static Map<String, String> get defaultQueryParams {
    return {
      'appid': '602dcffff671d09fbb0b505f983e09d6',
    };
  }
}
