import 'package:equatable/equatable.dart';

/// [Failure] class to map errors
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

/// [FailureToMessage] maps Exception to appropraite message
class FailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    var message = 'An Error occurred, please try again';
    if (failure is NoInternetFailure) {
      message = 'Please check your internet connection and try again';
    } else if (failure is ServerFailure) {
      message = failure.message;
    }
    return message;
  }
}
