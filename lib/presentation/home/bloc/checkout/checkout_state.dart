part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.loaded(
    List<ProductQuantity> products,
    int addressId,
    String paymentMethod,
    String shippingService,
    int shippingCost,
    String payementVAName,
  ) = _Loaded;
  const factory CheckoutState.erorr(String mesaage) = _Erorr;
}
