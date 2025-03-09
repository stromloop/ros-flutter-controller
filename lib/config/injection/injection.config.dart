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
    as _i17;
import 'package:ros_flutter/config/injection/register_module.dart' as _i16;
import 'package:ros_flutter/config/router/app_router.dart' as _i3;
import 'package:ros_flutter/data/dartros_1/data_source/navigation_data_source.dart'
    as _i6;
import 'package:ros_flutter/data/dartros_1/data_source/sub_data_source.dart'
    as _i10;
import 'package:ros_flutter/data/dartros_1/repositories/navigation_data_impl.dart'
    as _i5;
import 'package:ros_flutter/data/dartros_1/repositories/sub_data_impl.dart'
    as _i9;
import 'package:ros_flutter/data/websocket_ros2/data_source/navigation_data_source.dart'
    as _i14;
import 'package:ros_flutter/data/websocket_ros2/data_source/sub_data_source.dart'
    as _i13;
import 'package:ros_flutter/data/websocket_ros2/repositories/navigation_data_impl.dart'
    as _i7;
import 'package:ros_flutter/data/websocket_ros2/repositories/sub_data_impl.dart'
    as _i15;
import 'package:ros_flutter/data/websocket_ros2/resources/ros_node.dart'
    as _i12;
import 'package:ros_flutter/domain/repositories/navigation_repo.dart' as _i4;
import 'package:ros_flutter/domain/repositories/sub_repos.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

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
    gh.factory<_i4.RosNavRepo>(
      () => _i5.RosNavRepoImpl(gh<_i6.NavDataSource>()),
      instanceName: 'dartros1',
    );
    gh.factory<_i4.RosNavRepo>(() => _i7.RosNavRepoImpl());
    gh.factory<_i8.RosSubRepo>(
      () => _i9.SubRepositoryImpl(gh<_i10.SubDataSource>()),
      instanceName: 'dartros1',
    );
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i12.RosHandler>(
        () => registerModule.rosHandler(gh<_i11.SharedPreferences>()));
    gh.singleton<_i13.SubDataSource>(
        () => dataSourceInjectionModule.subDataSource(gh<_i12.RosHandler>()));
    gh.singleton<_i14.NavDataSource>(
        () => dataSourceInjectionModule.navDataSource(gh<_i12.RosHandler>()));
    gh.factory<_i8.RosSubRepo>(
        () => _i15.SubRepositoryImpl(gh<_i13.SubDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}

class _$DataSourceInjectionModule extends _i17.DataSourceInjectionModule {}
