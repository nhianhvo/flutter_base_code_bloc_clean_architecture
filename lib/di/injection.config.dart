// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../base_code/local/shared_preferences_repo.dart' as _i3;
import '../data_source/api_client/api_client.dart' as _i4;
import '../data_source/domain/repo/user_repo.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.SharedPreferencesRepo>(_i3.SharedPreferencesRepo());
  gh.singleton<_i4.ApiClient>(_i4.ApiClient(get<_i3.SharedPreferencesRepo>()));
  gh.singleton<_i5.IUserRepo>(_i5.IUserRepoImpl(get<_i4.ApiClient>()));
  return get;
}
