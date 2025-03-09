// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ros_flutter/config/injection/data_source_injection.dart'
    as _i13;
import 'package:ros_flutter/config/injection/register_module.dart' as _i12;
import 'package:ros_flutter/config/router/app_router.dart' as _i3;
import 'package:ros_flutter/data/dartros_1/data_source/navigation_data_source.dart'
    as _i7;
import 'package:ros_flutter/data/dartros_1/data_source/sub_data_source.dart'
    as _i6;
import 'package:ros_flutter/data/dartros_1/repositories/navigation_data_impl.dart' as _i9;
import 'package:ros_flutter/data/dartros_1/repositories/sub_data_impl.dart' as _i11;
import 'package:ros_flutter/domain/repositories/navigation_repo.dart' as _i8;
import 'package:ros_flutter/domain/repositories/sub_repos.dart' as _i10;
import 'package:ros_flutter/data/dartros_1/resources/ros_node.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final dataSourceInjectionModule = _$DataSourceInjectionModule();
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.RosHandler>(
        () => registerModule.rosHandler(gh<_i4.SharedPreferences>()));
    gh.singleton<_i6.SubDataSource>(
        () => dataSourceInjectionModule.subDataSource(gh<_i5.RosHandler>()));
    gh.singleton<_i7.NavDataSource>(
        () => dataSourceInjectionModule.navDataSource(gh<_i5.RosHandler>()));
    gh.factory<_i8.RosNavRepo>(
        () => _i9.RosNavRepoImpl(gh<_i7.NavDataSource>()));
    gh.factory<_i10.RosSubRepo>(
        () => _i11.SubRepositoryImpl(gh<_i6.SubDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}

class _$DataSourceInjectionModule extends _i13.DataSourceInjectionModule {}
