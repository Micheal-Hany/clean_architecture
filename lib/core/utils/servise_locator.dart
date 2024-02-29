import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implment.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeLocalDataSource: HomeLocalDataSourceImpl(),
    homeRemoteDataSource: HomeRemoteDataSourceImpl(
      service: getIt.get<ApiService>(),
    ),
  ));
}
