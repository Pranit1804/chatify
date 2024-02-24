import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:chatify/modules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocListener> getAppStartupBlocListeners(
  GlobalKey<NavigatorState> navigatorStateGlobalKey,
) {
  return [
    BlocListener<SnackbarBloc, SnackbarState>(
      listener: (context, state) =>
          _processSnackbarState(context, state, navigatorStateGlobalKey),
    ),
  ];
}

Future<void> _processSnackbarState(
  BuildContext context,
  SnackbarState state,
  GlobalKey<NavigatorState> navigatorStateGlobalKey,
) async {
  if (state is ShowSnackbarState) {
    ScaffoldMessenger.of(context)
        .showSnackBar(Snackbar.build(state.type, state.title, state.message));
  }
}
