class ApiHost {
  ApiHost._();

  /// Data Base URL

  static String get dataBaseUrl {
    return 'https://api.openweathermap.org/data/$dataApiVersion';
  }

  static String get dataApiVersion => '2.5';

  /// Geo Base URL

  static String get geoBaseUrl {
    return 'http://api.openweathermap.org/geo/$geoApiVersion/';
  }

  static String get geoApiVersion => '1.0';

  /// Default Parameters

  static Map<String, String> get defaultQueryParams {
    return {
      'appid': '602dcffff671d09fbb0b505f983e09d6',
    };
  }
}
