import 'package:get_it/get_it.dart';

import '../controllers/theme_mode/theme_mode_cubit.dart';

final getIt = GetIt.instance;

class GetItService {
  Future<void> init() async {
    _initServices();
    _initRepositories();
    _initUseCases();
    _initBlocs();
  }

  void _initServices() {}

  void _initRepositories() {}

  void _initUseCases() {}

  void _initBlocs() {
    getIt.registerLazySingleton<ThemeModeCubit>(() => ThemeModeCubit());
  }
}
