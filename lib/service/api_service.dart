
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:jobstreet/service/compare_time.dart';
// import 'package:jobstreet/service/typedef.dart';




// class ApiService {
//   final BaseProvider _baseProvider;

//   ApiService(this._baseProvider);

//   String? token;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   final GetStorage storage = GetStorage();

//   Future<void> _getToken() async {
//     User? user = auth.currentUser;
//     String? timeStorage = storage.read('token-time');
//     String? tokenStorage = storage.read('token');

//     DateTime? time;
//     timeStorage != null ? time = DateTime.parse(timeStorage) : null;

//     if (user == null) return;

//     if (tokenStorage == null) {
//       return await user.getIdToken().then((value) async {
//         await storage.write('token', value);
//         await storage.write('token-time', DateTime.now().toIso8601String());
//         token = value;
//         debugPrint('get and save token to local storage');
//       });
//     }

//     if (time != null) {
//       final isExpired = compareTime(time, 50);
//       if (!isExpired) {
//         token = tokenStorage;
//         debugPrint('get current token');
//         return;
//       }
//     }

//     return await user.getIdToken(true).then((value) async {
//       await storage.write('token', value);
//       await storage.write('token-time', DateTime.now().toString());
//       token = value;
//       debugPrint('set fresh token');
//     });
//   }

//   get<T>({
//     required String endpoint,
//     JSON? query,
//     Map<String, String>? headers,
//     bool requiresAuthToken = false,
//   }) async {
//     if (requiresAuthToken) {
//       await _getToken();
//     }

//     var customHeaders = requiresAuthToken
//         ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
//         : {'Accept': 'application/json'};

//     if (headers != null) {
//       customHeaders.addAll(headers);
//     }

//     final response =
//         await _baseProvider.get(endpoint, headers: customHeaders, query: query);

//     var result = await Connectivity().checkConnectivity();
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi ||
//         !response.hasError) {
//       return _returnResponse(response);
//     } else {
//       throw Exception('No Connection');
//     }
//   }

//   post<T>({
//     required String endpoint,
//     dynamic body,
//     JSON? query,
//     Map<String, String>? headers,
//     bool requiresAuthToken = false,
//   }) async {
//     if (requiresAuthToken) {
//       await _getToken();
//     }
//     var customHeaders = requiresAuthToken
//         ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
//         : {'Accept': 'application/json'};

//     if (headers != null) {
//       customHeaders.addAll(headers);
//     }

//     final response = await _baseProvider.post(endpoint, body,
//         headers: customHeaders, query: query);

//     var result = await Connectivity().checkConnectivity();
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi ||
//         !response.hasError) {
//       return _returnResponse(response);
//     } else {
//       throw Exception('No Connection');
//     }
//   }

//   put<T>({
//     required String endpoint,
//     dynamic body,
//     JSON? query,
//     Map<String, String>? headers,
//     bool requiresAuthToken = false,
//   }) async {
//     if (requiresAuthToken) {
//       await _getToken();
//     }

//     var customHeaders = requiresAuthToken
//         ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
//         : {'Accept': 'application/json'};

//     if (headers != null) {
//       customHeaders.addAll(headers);
//     }

//     final response = await _baseProvider.put(endpoint, body,
//         headers: customHeaders, query: query);

//     var result = await Connectivity().checkConnectivity();
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi ||
//         !response.hasError) {
//       return _returnResponse(response);
//     } else {
//       throw Exception('No Connection');
//     }
//   }

//   delete<T>({
//     required String endpoint,
//     JSON? body,
//     JSON? query,
//     Map<String, String>? headers,
//     bool requiresAuthToken = false,
//   }) async {
//     if (requiresAuthToken) {
//       await _getToken();
//     }

//     var customHeaders = requiresAuthToken
//         ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
//         : {'Accept': 'application/json'};

//     if (headers != null) {
//       customHeaders.addAll(headers);
//     }

//     final response = await _baseProvider.delete(endpoint,
//         headers: customHeaders, query: query);

//     var result = await Connectivity().checkConnectivity();
//     if (result == ConnectivityResult.mobile ||
//         result == ConnectivityResult.wifi ||
//         !response.hasError) {
//       return _returnResponse(response);
//     } else {
//       throw Exception('No Connection');
//     }
//   }
  

// dynamic _returnResponse(Response<dynamic> response) {
//   switch (response.statusCode) {
//     case 200:
//       return response.body;
//     case 201:
//       return response.body;
//     case 400:
//       throw BadRequestException(response.body['message']);
//     case 401:
//       throw UnauthorizedException(response.bodyString);
//     case 403:
//       throw ForbiddenException(response.bodyString);
//     case 404:
//       throw BadRequestException(response.bodyString);
//     case 500:
//       throw FetchDataException('Internal Server Error');
//     default:
//       throw FetchDataException(
//           'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
//   }
// }

// class AppException implements Exception String s{
//   final String? code;
//   final String? message;
//   final String? details;

//   AppException({this.code, this.message, this.details});

//   @override
//   String toString() {
//     // return "[$code]: $message \n $details";
//     return '$details';
//   }
// }

// class FetchDataException extends AppException {
//   FetchDataException(String? details)
//       : super(
//           code: "fetch-data",
//           message: "Error During Communication",
//           details: details,
//         );
// }

// class BadRequestException extends AppException {
//   BadRequestException(String? details)
//       : super(
//           code: "invalid-request",
//           message: "Invalid Request",
//           details: details,
//         );
// }

// class UnauthorizedException extends AppException {
//   UnauthorizedException(String? details)
//       : super(
//           code: "unauthorized",
//           message: "Unauthorized",
//           details: details,
//         );
// }

// class ForbiddenException extends AppException {
//   ForbiddenException(String? details)
//       : super(
//           code: "Forbidden",
//           message: "forbidden",
//           details: details,
//         );
// }

// class InvalidInputException extends AppException {
//   InvalidInputException(String? details)
//       : super(
//           code: "invalid-input",
//           message: "Invalid Input",
//           details: details,
//         );
// }

// class AuthenticationException extends AppException {
//   AuthenticationException(String? details)
//       : super(
//           code: "authentication-failed",
//           message: "Authentication Failed",
//           details: details,
//         );
// }

// class TimeOutException extends AppException {
//   TimeOutException(String? details)
//       : super(
//           code: "request-timeout",
//           message: "Request TimeOut",
//           details: details,
//         );
// }
