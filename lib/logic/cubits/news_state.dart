part of 'news_cubit.dart';

@immutable
abstract class NewsState {}
class NewsInitialState extends NewsState {}

class NewsNoInternetState extends NewsState{}

class BusinessLoadingState extends NewsState {}
class BusinessSucState extends NewsState{}
class BusinessErrorState extends NewsState{
  final String error ;
  BusinessErrorState({required this.error});
}

class HealthLoadingState extends NewsState {}
class HealthSucState extends NewsState{}
class HealthErrorState extends NewsState{
  final String error ;
  HealthErrorState({required this.error});
}

class SportsLoadingState extends NewsState {}
class SportsSucState extends NewsState{}
class SportsErrorState extends NewsState{
  final String error ;
  SportsErrorState({required this.error});
}

class ScienceLoadingState extends NewsState {}
class ScienceSucState extends NewsState{}
class ScienceErrorState extends NewsState{
  final String error ;
  ScienceErrorState({required this.error});
}
