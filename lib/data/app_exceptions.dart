class AppExceptions implements Exception {
  final message;
  final prefix;

  AppExceptions([this.message, this.prefix]);

  String toString(){
    return '$prefix$message';
  }
}
class FetchDataExceptions extends AppExceptions{
  FetchDataExceptions([String? message]) : super(message,'Error during communication');
}

class BadRequestExceptions extends AppExceptions{
  BadRequestExceptions([String? message]) : super(message,'Invelid Token');
}

class UnauthorisedExceptions extends AppExceptions{
  UnauthorisedExceptions([String? message]) : super(message,'Error during communication');
}