import 'package:dartz/dartz.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/entities/result.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/errors/erros.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/repositories/search_repository.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/datasources/search_datasource.data.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/models/result_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Result>>> getUsers(String searchText) async {
    List<ResultModel> list;

    try {
      list = await datasource.searchText(searchText);
    } catch (e) {
      return left(ErrorSearch());
    }

    return list == null ? left(DatasourceResultNull()) : right(list);
  }
}
