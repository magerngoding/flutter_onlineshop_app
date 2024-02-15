part of 'all_product_bloc.dart';

@freezed
class AllProductState with _$AllProductState {
  const factory AllProductState.initial() = _Initial;
  const factory AllProductState.loading() = Loading;
  const factory AllProductState.loadded(List<Product> products) = _Loaded;
  const factory AllProductState.erorr(String message) = _Erorr;
}
