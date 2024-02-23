import 'package:chatify/modules/auth/bloc/auth_bloc.dart';
import 'package:chatify/modules/auth/data/auth_local_data_source.dart';
import 'package:chatify/modules/auth/data/auth_remote_data_source.dart';
import 'package:chatify/modules/auth/data/auth_repository.dart';
import 'package:chatify/modules/auth/domain/auth_repository_impl.dart';
import 'package:chatify/modules/auth/domain/entities/auth_use_case.dart';
import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:kiwi/kiwi.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static late KiwiContainer container;

  static setUp() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUseCases();
    _configureRepositories();
    _configureRemoteDataSources();
    _configureLocalDataSource();
    // _configureOther();
  }

  /// =========== Register Blocs/Cubits ===================
  @Register.singleton(SnackbarBloc)
  @Register.factory(AuthBloc)
  void _configureBlocs();

  /// =========== Register UseCases ===================

  @Register.factory(AuthUseCase)
  void _configureUseCases();

  /// =========== Register Repositories ===================

  @Register.factory(
    AuthRepository,
    from: AuthRepositoryImpl,
  )
  void _configureRepositories();

  /// =========== Register RemoteDataSources ===================

  @Register.factory(AuthRemoteDataSource)
  void _configureRemoteDataSources();

  /// =========== Register LocalDataSource ===================

  @Register.factory(AuthLocalDataSource)
  void _configureLocalDataSource();
}
