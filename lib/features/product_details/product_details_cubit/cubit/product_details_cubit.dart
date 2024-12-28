import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void loadProductDetails() {
    emit(ProductDetailsLoading());
    try {
      emit(ProductDetailsLoaded());
    } catch (e) {
      emit(ProductDetailsError(message: 'failed to load product details'));
    }
  }
}
