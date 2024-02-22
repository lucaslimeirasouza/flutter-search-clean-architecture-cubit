import 'package:dio/dio.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/repositories/search_repository.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/usecases/seach_by_text.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/external/github_search_datasource.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/datasources/search_datasource.data.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/presenter/search_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

startModule([Dio? dio]) {
  sl.registerFactory<SearchByText>(
      () => SearchByTextImpl(sl<SearchRepository>()));
  sl.registerFactory<SearchRepository>(
      () => SearchRepositoryImpl(sl<SearchDatasource>()));
  sl.registerFactory<SearchDatasource>(() => GithubSearchDatasource(sl()));
  sl.registerFactory(() => dio ?? Dio());

  //singleton
  sl.registerLazySingleton(() => SearchCubit(sl<SearchByText>()));
}

disposeModule() {
  sl.get<SearchCubit>().close();
  sl.unregister<SearchCubit>();
}
