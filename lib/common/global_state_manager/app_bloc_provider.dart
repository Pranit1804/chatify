import 'package:chatify/di/injector.dart';
import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> getStartupBlocProviders() => [
      BlocProvider<SnackbarBloc>(
        create: (BuildContext context) => Injector.resolve<SnackbarBloc>(),
      ),
    ];
