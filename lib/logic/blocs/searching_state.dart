
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:know_news/data/network/models/news_model.dart';
// part of 'blocs/searching_bloc.dart';


@immutable
abstract class SearchingState {}

class NoNewsArticle extends SearchingState {}
class SearchLoadingState extends SearchingState {}
class SearchCompleteState extends SearchingState with EquatableMixin{

  final List<ArticleModel> searchResult ;

  SearchCompleteState({required this.searchResult});

  @override
  List<Object?> get props => [searchResult];

  @override
  String toString() {
    return 'SearchCompleteState{searchResult: $searchResult}';
  }
}
class SearchingErrorState extends SearchingState{
  final String error ;
  SearchingErrorState({required this.error});
}
