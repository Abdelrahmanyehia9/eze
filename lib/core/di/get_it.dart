import 'package:eze/shared/presentation/controllers/main_layout_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class DI {
  static Future<void> init() async {
    await _setupSingletons();
    await _setupFactories();
  }

  static Future<void> _setupSingletons() async {}

  static Future<void> _setupFactories() async {
    _setupCubit();
  }

  static void _setupCubit() {
    sl.registerFactory(() => MainLayoutCubit());
  }

  static Future<void> reset() async {
    await sl.reset();
  }
}
