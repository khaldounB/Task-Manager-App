class EndPoints {
  static final EndPoints _endPoints = EndPoints._internal();

  factory EndPoints() {
    return _endPoints;
  }

  EndPoints._internal();

  static const String api = 'https://dummyjson.com/';

  /// Authentication

  String login = '${api}auth/login';
  String me = '${api}auth/me';
  String refreshToken = '${api}auth/refresh';

  /// To-DO
  String getAllToDo = '${api}todos/user/{id}?limit={limit}&skip={skip}';
  String toDo = '${api}todos/{id}';
  String addToDo = '${api}todos/add';
}
