import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:know_news/data/network/models/news_model.dart';
import 'package:know_news/data/network/repository.dart';
import 'package:know_news/logic/blocs/searching_event.dart';
import 'package:know_news/logic/blocs/searching_state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  final SearchingRepo repo ;
  SearchingBloc({required this.repo}) : super(NoNewsArticle()) {
    on<SearchingEvent>((event, emit) async {
      if(event is GetSearchingEvent){
        try{
          emit(SearchLoadingState());
          await Future.delayed(const Duration(seconds: 1));
          final List<ArticleModel> searchResult =await repo.getSearch(event.queryChanged);
          if (searchResult == []){
            emit (NoNewsArticle());
          }
          emit(SearchCompleteState(searchResult: searchResult));
        }catch(e){

          emit(SearchingErrorState(error: e.toString()));
          addError(e,StackTrace.current);
        }
      }
    });
  }
    }


