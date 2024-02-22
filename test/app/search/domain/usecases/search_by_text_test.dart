import 'package:dartz/dartz.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/entities/result.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/errors/erros.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/repositories/search_repository.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/usecases/seach_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista com resultados', () async {
    when(repository.getUsers("jacob"))
        .thenAnswer((_) async => right(<Result>[Result()]));

    var result = await usecase("jacob");
    expect(result | null!, isA<List<Result>>());
  });

  test('deve retornar um InvalidSearchText caso o texto seja inválido',
      () async {
    var result = await usecase(null!);
    expect(result.fold(id, id), isA<InvalidSearchText>());
  });
  test('deve retornar um EmptyList caso o retorno seja vazio', () async {
    when(repository.getUsers("jacob"))
        .thenAnswer((_) async => right(<Result>[]));

    var result = await usecase("jacob");
    expect(result.fold(id, id), isA<EmptyList>());
  });
}
