import 'package:get_it/get_it.dart';
import '../base_code/local/shared_preferences_repo.dart';
import '../feature/home/home_bloc.dart';
import '../feature/second/second_bloc.dart';

final getIt = GetIt.instance;

void setUpInjector() {
  getIt.registerSingleton(SharedPreferencesRepo());

  ///Setup repo
  // getIt.registerSingleton<TaskRepo>(TaskRepoImpl());

  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<SecondBloc>(() => SecondBloc(getIt(), getIt()));
}
