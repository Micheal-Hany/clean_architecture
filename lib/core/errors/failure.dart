import 'package:dio/dio.dart';

abstract class Faluire {
  final String errorMassage;
  Faluire({
    required this.errorMassage,
  });
}

class ServerFailure extends Faluire {
  ServerFailure({required super.errorMassage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMassage: "connectionTimeout");

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMassage: "sendTimeout");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMassage: "receiveTimeout");

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMassage: "badCertificate");

      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response);

      case DioExceptionType.cancel:
        return ServerFailure(errorMassage: "cancel");

      case DioExceptionType.connectionError:
        return ServerFailure(errorMassage: "no internet connection");

      case DioExceptionType.unknown:
        return ServerFailure(errorMassage: "error unknown");
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic responce) {
    if (statusCode == 404) {
      return ServerFailure(
          errorMassage: 'your request failed please type again later');
    } else if (statusCode == 500) {
      return ServerFailure(errorMassage: 'there is a problem with the server');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMassage: responce["error"]['massage']);
    } else {
      return ServerFailure(errorMassage: "there is a problem try again later");
    }
  }
}
