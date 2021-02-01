/// [HttpException] is used to throw custom exception that could happen when failure happen

class HttpException implements Exception {
  final _message;
  final _prefix;

  HttpException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

// HTTP Exception

// Thrown for generic HTTP Request error
class FetchDataException extends HttpException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

// Thrown when HTTP error code 400 happes
class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

// Thrown when HTTP error code 401 & 403 happes
class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

// Thrown when Invalid input
class InvalidInputException extends HttpException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
