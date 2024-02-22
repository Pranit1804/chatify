import 'package:chatify/common/utils/screen_utils.dart';
import 'package:kiwi/kiwi.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static late KiwiContainer container;

  static setUp() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    injector._configure();
  }

  void _configure() {
    // _configureBlocs();
    // _configureUseCases();
    // _configureRepositories();
    // _configureRemoteDataSources();
    // _configureLocalDataSource();
    _configureCommon();
    // _configureOther();
  }

  static final resolve = container.resolve;

  @Register.factory(ScreenUtils)
  void _configureCommon();
}