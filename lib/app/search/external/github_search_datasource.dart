import 'package:dio/dio.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/datasources/search_datasource.data.dart';
import 'package:flutter_search_clean_architeture_cubit/app/search/infra/models/result_model.dart';

class GithubSearchDatasource implements SearchDatasource {
  final Dio dio;

  GithubSearchDatasource(this.dio);

  @override
  Future<List<ResultModel>> searchText(String textSearch) async {
    var result = await this.dio.get(
        "https://api.github.com/search/users?q=${textSearch.trim().replaceAll(' ', '+')}");
    if (result.statusCode == 200) {
      var jsonList = result.data['items'] as List;
      var list = jsonList
          .map((item) => ResultModel(
              nickname: item['login'],
              image: item['avatar_url'],
              url: item['url']))
          .toList();
      return list;
    } else {
      throw Exception();
    }
  }
}
