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
          snackbarBloc: c<SnackbarBloc>()))
      ..registerFactory((c) => HomeBloc(
          homeUseCase: c<HomeUseCase>(), snackbarBloc: c<SnackbarBloc>()));
  }

  @override
  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthUseCase(c<AuthRepository>()))
      ..registerFactory((c) => HomeUseCase(c<HomeRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AuthRepository>((c) => AuthRepositoryImpl(
          c<AuthRemoteDataSource>(), c<AuthLocalDataSource>()))
      ..registerFactory<HomeRepository>((c) => HomeRepositoryImpl(
          c<HomeRemoteDataSource>(), c<HomeLocalDataSource>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthRemoteDataSource())
      ..registerFactory((c) => HomeRemoteDataSource());
  }

  @override
  void _configureLocalDataSource() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthLocalDataSource())
      ..registerFactory((c) => HomeLocalDataSource());
  }
}
