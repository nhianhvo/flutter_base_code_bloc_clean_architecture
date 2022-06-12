import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/feature/home/home_bloc.dart';
import 'package:flutter_test_bloc/route/router.dart';
import 'di/injection.dart';
import 'feature/home/home.dart';
import 'feature/second/second_bloc.dart';

Future<void> main() async {
  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   blocObserver: AppBlocObserver(),
  // );
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDependencies();
  await configureDependencies();
  runApp(const MyApp());
}

// class AppBlocObserver extends BlocObserver {
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) print(change);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<HomeBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<SecondBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
          initialRoute: Routes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
