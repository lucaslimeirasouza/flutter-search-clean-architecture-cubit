import 'package:dartz/dartz.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/entities/result.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/errors/erros.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Result>>> getUsers(String searchText);
}
