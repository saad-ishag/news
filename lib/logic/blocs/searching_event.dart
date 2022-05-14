// part of 'searching_bloc.dart';

import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchingEvent {}
// in the event i don't need to extend the equality

class GetSearchingEvent extends SearchingEvent {
  final String queryChanged ;
  GetSearchingEvent({required this.queryChanged});

  @override
  String toString() {
    return 'GetSearchingEvent{queryChanged: $queryChanged}';
  }
}
class Submitted extends SearchingEvent{}
