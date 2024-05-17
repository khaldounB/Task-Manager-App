class RequestConfiguration{
  static final RequestConfiguration _requestConfiguration = RequestConfiguration._internal();

  factory RequestConfiguration(){
    return _requestConfiguration;
  }

  RequestConfiguration._internal();
  static const String host = "https://dummyjson.com/";
}