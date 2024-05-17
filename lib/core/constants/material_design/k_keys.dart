class KKeys{
  static final KKeys _kKeys = KKeys._internal();

  factory KKeys() {
    return _kKeys;
  }

  KKeys._internal();

  final String token = 'token';
  final String firstName = 'firstName';
  final String lastName = 'lastName';
  final String id = 'id';
  final String username = 'username';
  final String email = 'email';
  final String gender = 'gender';
  final String image = 'image';
}