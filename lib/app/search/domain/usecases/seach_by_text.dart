import 'package:dartz/dartz.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/entities/result.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/errors/erros.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<Failure, List<Result>>> call(String textSearch);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(String textSearch) async {
    var option = optionOf(textSearch);

    return option.fold(() => Left(InvalidSearchText()), (text) async {
      var result = await repository.getUsers(text);
      return result.fold(
          (l) => left(l), (r) => r.isEmpty ? left(EmptyList()) : right(r));
    });
  }
}
