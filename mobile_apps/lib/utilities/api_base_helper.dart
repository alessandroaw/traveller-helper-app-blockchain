import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './generics/http_exceptions.dart';

class ApiBaseHelper {
  String baseUrl = 'blockchain.luqmanr.xyz';
  Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Duration _timeoutDuration = Duration(seconds: 3);

  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    var responseJson;
    try {
      Uri uri = new Uri.http(baseUrl, '/api/$url');
      print('GET: $uri');
      http.Response response = await http
          .get(
            uri,
            headers: _mergeHeaders(headers),
          )
          .timeout(
            _timeoutDuration,
          );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Connection Timeout');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Map<String, String> headers, dynamic body}) async {
    var responseJson;
    try {
      Uri uri = new Uri.http(baseUrl, '/api/$url');
      print('POST: $uri');
      http.Response response = await http
          .post(
            uri,
            headers: _mergeHeaders(headers),
            body: body,
          )
          .timeout(_timeoutDuration);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> patch(String url,
      {Map<String, String> headers, dynamic body}) async {
    var responseJson;
    try {
      Uri uri = new Uri.http(baseUrl, '/api/$url');
      print('PATCH: $uri');
      http.Response response = await http
          .patch(
            uri,
            headers: _mergeHeaders(headers),
            body: body,
          )
          .timeout(_timeoutDuration);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url,
      {Map<String, String> headers, dynamic body}) async {
    var responseJson;
    try {
      Uri uri = new Uri.http(baseUrl, '/api/$url');
      print('PUT: $uri');
      http.Response response = await http
          .put(
            uri,
            headers: _mergeHeaders(headers),
            body: body,
          )
          .timeout(_timeoutDuration);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {Map<String, String> headers, dynamic body}) async {
    var responseJson;
    try {
      Uri uri = new Uri.http(baseUrl, '/api/$url');
      print('DELETE: $uri');
      http.Response response = await http
          .delete(
            uri,
            headers: _mergeHeaders(headers),
          )
          .timeout(_timeoutDuration);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Map<String, String> _mergeHeaders([Map<String, String> headers]) {
    return {..._headers, ...?headers};
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = jsonDecode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
