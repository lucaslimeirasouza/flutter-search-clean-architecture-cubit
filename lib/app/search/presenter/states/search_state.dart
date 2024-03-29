import 'package:flutter_search_clean_architeture_cubit/app/search/domain/entities/result.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/domain/errors/erros.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
  const LoadingState();
}

class ErrorState implements SearchState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<Result> list;
  const SuccessState(this.list);
}
