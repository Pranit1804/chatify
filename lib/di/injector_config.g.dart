// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => SnackbarBloc())
      ..registerFactory((c) => AuthBloc(
          authencationUseCase: c<AuthUseCase>(),
          snackbarBloc: c<SnackbarBloc>()));
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => AuthUseCase(c<AuthRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<AuthRepository>(
        (c) => AuthRepositoryImpl(c<AuthRemoteDataSource>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => AuthRemoteDataSource());
  }

  @override
  void _configureLocalDataSource() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => AuthLocalDataSource());
  }
}
