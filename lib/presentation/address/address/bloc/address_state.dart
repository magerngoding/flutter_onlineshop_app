part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.erorr(String message) = _Erorr;
  const factory AddressState.loaded(List<Address> addresses) = _Loaded;
}
