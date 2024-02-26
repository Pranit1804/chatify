import 'package:chatify/modules/auth/bloc/auth_bloc.dart';
import 'package:chatify/modules/auth/data/auth_local_data_source.dart';
import 'package:chatify/modules/auth/data/auth_remote_data_source.dart';
import 'package:chatify/modules/auth/data/auth_repository.dart';
import 'package:chatify/modules/auth/domain/auth_repository_impl.dart';
import 'package:chatify/modules/auth/domain/entities/auth_use_case.dart';
import 'package:chatify/modules/chat/bloc/chat_bloc.dart';
import 'package:chatify/modules/chat/data/chat_local_data_source.dart';
import 'package:chatify/modules/chat/data/chat_remote_data_source.dart';
import 'package:chatify/modules/chat/data/chat_repository.dart';
import 'package:chatify/modules/chat/domain/chat_repository_impl.dart';
import 'package:chatify/modules/chat/domain/chat_use_case.dart';
import 'package:chatify/modules/home/bloc/home_bloc.dart';
import 'package:chatify/modules/home/data/home_local_data_source.dart';
import 'package:chatify/modules/home/data/home_remote_data_source.dart';
import 'package:chatify/modules/home/data/home_repository.dart';
import 'package:chatify/modules/home/domain/home_repository_impl.dart';
import 'package:chatify/modules/home/domain/home_use_case.dart';
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
  @Register.factory(HomeBloc)
  @Register.factory(ChatBloc)
  void _configureBlocs();

  /// =========== Register UseCases ===================

  @Register.factory(AuthUseCase)
  @Register.factory(HomeUseCase)
  @Register.factory(ChatUseCase)
  void _configureUseCases();

  /// =========== Register Repositories ===================

  @Register.factory(
    AuthRepository,
    from: AuthRepositoryImpl,
  )
  @Register.factory(
    HomeRepository,
    from: HomeRepositoryImpl,
  )
  @Register.factory(
    ChatRepository,
    from: ChatRepositoryImpl,
  )
  void _configureRepositories();

  /// =========== Register RemoteDataSources ===================

  @Register.factory(AuthRemoteDataSource)
  @Register.factory(HomeRemoteDataSource)
  @Register.factory(ChatRemoteDataSource)
  void _configureRemoteDataSources();

  /// =========== Register LocalDataSource ===================

  @Register.factory(AuthLocalDataSource)
  @Register.factory(HomeLocalDataSource)
  @Register.factory(ChatLocalDataSource)
  void _configureLocalDataSource();
}
