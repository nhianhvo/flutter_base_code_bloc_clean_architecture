import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/feature/home/home_bloc.dart';
import 'package:flutter_test_bloc/route/router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final home = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${home.state.countInt}'),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  'State: ${state.countInt}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.second);
                      // BlocProvider.of<HomeBloc>(context).add(ClickNextEvent());
                    },
                    child: const Text('Next'))
              ],
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(HomeClickButton());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
