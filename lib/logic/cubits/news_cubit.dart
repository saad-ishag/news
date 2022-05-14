
import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:know_news/constants.dart';
import 'package:know_news/data/network/dio_provider.dart';
import 'package:know_news/data/network/models/news_model.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  DioHelper dio = DioHelper();

  final List<ArticleModel> _business = [];
  final List<ArticleModel> _science = [];
  final List<ArticleModel> _health = [];
  final List<ArticleModel> _sports = [];

  List<ArticleModel> get business => _business;
  List<ArticleModel> get science => _science;
  List<ArticleModel> get health => _health;
  List<ArticleModel> get sports => _sports;

  void fetchBusiness() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result) {
      emit(BusinessLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      if (business.isEmpty) {
        dio.fetchData(url: kSecondaryUrl, query: {
          'country': kCountry,
          'category': 'business',
          'apiKey': knewApiKey,
        }).then((response) {
          if (response.statusCode == 200) {
            List<dynamic> articles = response.data['articles'];
            for (Map<String, dynamic> article in articles) {
              ArticleModel articleModel = ArticleModel.fromJson(article);
              business.add(articleModel);
            }
            emit(BusinessSucState());
          } else {
            print(response.statusCode);
          }
        }).catchError((e) {
          emit(BusinessErrorState(error: e.toString()));
          addError(e,StackTrace.current);
        });
      }
    }
    else {
      emit(NewsNoInternetState());
    }
  }

  void fetchScience() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result) {
      emit(ScienceLoadingState());
      if (science.isEmpty) {
        dio.fetchData(url: kSecondaryUrl, query: {
          'country': kCountry,
          'category': 'science',
          'apiKey': knewApiKey,
        }).then((response) {
          List<dynamic> articles = response.data['articles'];
          for (Map<String, dynamic> article in articles) {
            ArticleModel articleModel = ArticleModel.fromJson(article);
            science.add(articleModel);
            emit(ScienceSucState());
          }
        }).catchError((e) {
          emit(ScienceErrorState(error: e.toString()));
          addError(e,StackTrace.current);

        });
      }
    }else{
      emit(NewsNoInternetState());
    }
  }

  void fetchSports() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result) {
      emit(SportsLoadingState());
      if (sports.isEmpty) {
        dio.fetchData(url: kSecondaryUrl, query: {
          'country': 'gb',
          'category': 'sports',
          'apiKey': knewApiKey,
        }).then((response) {
          List<dynamic> articles = response.data['articles'];
          for (Map<String, dynamic> article in articles) {
            ArticleModel articleModel = ArticleModel.fromJson(article);
            sports.add(articleModel);
            emit(SportsSucState());
          }
        }).catchError((e) {
          emit(SportsErrorState(error: e.toString()));
          addError(e,StackTrace.current);

        });
      }
    }
    else{
      emit(NewsNoInternetState());
    }
  }

  void fetchHealth() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result) {
      emit(HealthLoadingState());
      if (health.isEmpty) {
          dio.fetchData(url: kSecondaryUrl, query: {
            'country': kCountry,
            'category': 'health',
            'apiKey': knewApiKey,
          }).then((response) {
            List<dynamic> articles = response.data['articles'];
            for (Map<String, dynamic> article in articles) {
              ArticleModel articleModel = ArticleModel.fromJson(article);
              health.add(articleModel);
              emit(HealthSucState());
            }
          }).catchError((e) {
            emit(HealthErrorState(error: e.toString()));
            addError(e,StackTrace.current);
          });

      }
    }else{
      emit(NewsNoInternetState());
    }
  }
  }
