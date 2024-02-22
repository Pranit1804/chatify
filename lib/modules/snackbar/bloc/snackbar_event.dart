part of 'snackbar_bloc.dart';

abstract class SnackbarEvent {}

class ShowSnackbarEvent extends SnackbarEvent {
  String? title;
  String message;
  SnackbarType type;

  ShowSnackbarEvent({
    this.title,
    required this.message,
    required this.type,
  });

  factory ShowSnackbarEvent.forError(String message) {
    return ShowSnackbarEvent(message: message, type: SnackbarType.error);
  }

  factory ShowSnackbarEvent.forSomethingWentWrong() {
    return ShowSnackbarEvent(
        message: AppConstants.somethingWentWrong, type: SnackbarType.error);
  }

  factory ShowSnackbarEvent.forWarning(String message) {
    return ShowSnackbarEvent(message: message, type: SnackbarType.warning);
  }

  factory ShowSnackbarEvent.forSuccess(String message) {
    return ShowSnackbarEvent(message: message, type: SnackbarType.success);
  }
}

class DismissSnackbarEvent extends SnackbarEvent {}
