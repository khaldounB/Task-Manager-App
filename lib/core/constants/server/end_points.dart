class EndPoints {
  static final EndPoints _endPoints = EndPoints._internal();

  factory EndPoints() {
    return _endPoints;
  }

  EndPoints._internal();

  static const String api = 'https://dummyjson.com/';

  /// Authentication

  static const String login = '${api}auth/login';
  static const String me = '${api}auth/me';
  static const String refreshToken = '${api}auth/refresh';

  /// To-DO
  static const String getAllToDo = '${api}todos/user/{id}?limit={limit}&skip={skip}';
  static const String toDo = '${api}todos/{id}';
  static const String addToDo = '${api}todos/add';
}
