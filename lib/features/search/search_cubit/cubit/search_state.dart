part of 'search_cubit.dart';

class SearchState {}

final class SearchInitial extends SearchState {}

final class Searching extends SearchState {}

final class Searched extends SearchState {
  final List<Articles> articles;
  Searched({required this.articles});
}

final class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
