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
    // _configureUseCases();
    // _configureRepositories();
    // _configureRemoteDataSources();
    // _configureLocalDataSource();
    // _configureOther();
  }

  /// =========== Register Blocs/Cubits ===================
  @Register.singleton(SnackbarBloc)
  void _configureBlocs();
}
