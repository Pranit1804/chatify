import 'package:bloc/bloc.dart';
import 'package:chatify/common/constants/app_constants.dart';
import 'package:chatify/modules/snackbar/snackbar_type.dart';

part 'snackbar_event.dart';
part 'snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(SnackBarInitialState()) {
    on<ShowSnackbarEvent>(_onShowSnackbarEvent);
    on<DismissSnackbarEvent>(_onDismissSnackbarEvent);
  }

  void _onShowSnackbarEvent(
    ShowSnackbarEvent event,
    Emitter<SnackbarState> emit,
  ) {
    emit(ShowSnackbarState(
        title: event.title, message: event.message, type: event.type));
  }

  void _onDismissSnackbarEvent(
    DismissSnackbarEvent event,
    Emitter<SnackbarState> emit,
  ) {
    emit(DismissedSnackbarState());
  }
}
