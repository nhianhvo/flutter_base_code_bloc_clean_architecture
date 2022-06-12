import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../feature/home/home_bloc.dart';
import '../feature/second/second_bloc.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => {
      $initGetIt(getIt),
      getIt.registerFactory<HomeBloc>(() => HomeBloc()),
      getIt.registerFactory<SecondBloc>(() => SecondBloc(getIt(), getIt())),
    };
