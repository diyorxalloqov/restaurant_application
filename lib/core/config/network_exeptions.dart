// import 'package:restaurant_app/modules/global/imports/app_imports.dart';
//
// abstract class NetworkResponseConfig {
//   NetworkResponseConfig();
// }
//
// class NetworkSuccesResponse<Model> extends NetworkResponseConfig {
//   Model model;
//   NetworkSuccesResponse(this.model);
// }
//
// class NetworkErrorResponse extends NetworkResponseConfig {
//   String error = "";
//   int statusCode = 0;
//
//   NetworkErrorResponse(this.error, this.statusCode) {
//     if (statusCode == 400) {
//       error = badRequest;
//     } else if (statusCode == 401) {
//       error = notAuthorized;
//     } else if (statusCode == 404) {
//       error = notHaveData;
//     } else if (statusCode == 500) {
//       error = serverError;
//     }
//   }
// }
//
// class NetworkExeptionResponse extends NetworkResponseConfig {
//   DioException exeption;
//   String messageForUser = '';
//   NetworkExeptionResponse(this.exeption) {
//     debugPrint(exeption.type.toString());
//     if (exeption.type == DioExceptionType.sendTimeout ||
//         exeption.type == DioExceptionType.unknown) {
//       messageForUser = internetError;
//     } else if (exeption.type == DioExceptionType.connectionTimeout ||
//         exeption.type == DioExceptionType.receiveTimeout) {
//       messageForUser = serverError;
//     } else if (exeption.type == DioExceptionType.connectionError ||
//         exeption.type == DioExceptionType.cancel) {
//       messageForUser = noInternet;
//     } else if (exeption.type == DioExceptionType.badResponse) {
//       messageForUser = notHaveData;
//     } else {
//       messageForUser = exeption.message.toString();
//     }
//   }
// }
