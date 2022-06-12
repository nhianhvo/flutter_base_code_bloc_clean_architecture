import 'package:dio/dio.dart';
import 'package:flutter_test_bloc/data_source/api_client/api_client.dart';
import 'package:flutter_test_bloc/feature/home/home_bloc.dart';
import 'package:flutter_test_bloc/feature/second/second_bloc.dart';
import 'package:get_it/get_it.dart';
import '../base_code/local/shared_preferences_repo.dart';
import '../data_source/domain/repo/user_repo.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //
  getIt.registerSingleton(SharedPreferencesRepo());
  // Dio client
  getIt.registerSingleton<Dio>(Dio());

  // Dependencies
  getIt.registerSingleton<ApiClient>(ApiClient(getIt()));

  // Repositories
  getIt.registerSingleton<IUserRepo>(
    IUserRepoImpl(getIt()),
  );

  // Blocs
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<SecondBloc>(() => SecondBloc(getIt(), getIt()));
}
