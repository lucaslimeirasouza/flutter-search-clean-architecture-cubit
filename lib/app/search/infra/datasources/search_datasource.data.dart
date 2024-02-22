import 'package:flutter_search_clean_architeture_cubit/app/search/infra/models/result_model.dart';

abstract class SearchDatasource {
  Future<List<ResultModel>> searchText(String textSearch);
}
