import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/core/base_widget.dart';
import 'package:flutter_test_bloc/feature/home/home_bloc.dart';
import 'package:flutter_test_bloc/feature/second/second_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // print(homeBloc.state.countInt)
    super.initState();
  }

  // @override
  // void dispose() {
  //   homeBloc.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: BlocListener<HomeBloc, HomeState>(
          listener: ((context, homeState) {
            return;
          }),
          child: BlocBuilder<SecondBloc, SecondState>(
            builder: (context, state) {
              if (state is SecondLoading) {
                return const LoadingWidget();
                // print('Loading...');
              } else if (state is SecondLoadingDone) {
                print('Loading done.');
              } else if (state is SecondLoadingError) {
                print('Loading error');
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: ((context, homeState) {
                        return Text('${homeState.countInt}');
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Login'),
                    Column(
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(hintText: 'Username'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(hintText: 'password'),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SecondBloc>(context).add(LoginEvent(
                            username: _usernameController.text,
                            password: _passwordController.text));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: const Text('Login')),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: const Text("Comments"),
    );
  }
}
