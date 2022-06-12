import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_bloc/data_source/domain/repo/user_repo.dart';
import 'package:flutter_test_bloc/data_source/domain/repo/user_usecase.dart';
import 'package:flutter_test_bloc/model/login_request.dart';

import '../../base_code/local/shared_preferences_repo.dart';

class SecondState {
  const SecondState();
}

class SecondLoading extends SecondState {
  const SecondLoading();
}

class SecondNormalState extends SecondState {
  const SecondNormalState();
}

class SecondLoadingError extends SecondState {
  const SecondLoadingError();
}

class SecondLoadingDone extends SecondState {
  const SecondLoadingDone();
}

abstract class SecondEvent {}

class LoginEvent extends SecondEvent {
  String? username, password;
  LoginEvent({this.username, this.password});
}

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc(this._authRepo, this._sharedPreferencesRepo)
      : super(const SecondNormalState());

  final IUserRepo _authRepo;
  final SharedPreferencesRepo _sharedPreferencesRepo;

  @override
  Stream<SecondState> mapEventToState(SecondEvent event) async* {
    if (event is LoginEvent) {
      yield* _login(event.username, event.password);
    }
  }

  Stream<SecondState> _login(String? username, String? password) async* {
    yield const SecondLoading();
    final response = await _authRepo.login(
      LoginRequest(
        username: username,
        password: password,
      ),
    );
    if (response != null) {
      if (response.isSuccess) {
        _sharedPreferencesRepo.saveToken(response.data!.accessToken);
        yield const SecondLoadingDone();
      } else {
        yield const SecondLoadingError();
      }
    }
  }
}
