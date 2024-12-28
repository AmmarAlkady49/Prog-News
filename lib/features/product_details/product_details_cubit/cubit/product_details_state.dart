part of 'product_details_cubit.dart';

class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  // final Articles article;
  // ProductDetailsLoaded({required this.article});
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
