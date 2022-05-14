import 'package:know_news/data/network/dio_provider.dart';

import '../../constants.dart';
import 'models/news_model.dart';

class SearchingRepo {
  //List<ArticleModel> articleModelResult = [] ;
  //it works i just need to wait some time , and i need to fix
  DioHelper dio = DioHelper();

  Future getSearch(String newsQuery) async {
    List<ArticleModel>articleModelResult = [];
    await dio.fetchData(url: 'v2/everything', query: {
      "q": newsQuery,
      "apiKey": knewApiKey,
    }).then((response) {
      List<dynamic> articles = response.data['articles'];
      articleModelResult = articles
          .map((article) => ArticleModel.fromJson(article))
          .where((element) {
        final queryLower = newsQuery.toLowerCase();
        final newsLower = element.title.toLowerCase();
        return newsLower.contains(queryLower);
      }).toList();
    });
    return articleModelResult;
  }
}