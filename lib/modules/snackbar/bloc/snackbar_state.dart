part of 'snackbar_bloc.dart';
abstract class SnackbarState {
  final String? title;
  final String message;
  final SnackbarType type;
  SnackbarState({
    this.title,
    required this.message,
    required this.type
  });
}

class SnackBarInitialState extends SnackbarState {
  SnackBarInitialState() : super(title: "", message: "", type: SnackbarType.none);
}

class ShowSnackbarState extends SnackbarState {
  ShowSnackbarState(
    {
      String? title,
      required String message,
      required SnackbarType type
    }
  ) : super(title: title, message: message, type: type);
}

class DismissedSnackbarState extends SnackbarState {  
  DismissedSnackbarState() : super(title: "", message: "", type: SnackbarType.none);
}
