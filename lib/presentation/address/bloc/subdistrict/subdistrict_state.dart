part of 'subdistrict_bloc.dart';

@freezed
class SubdistrictState with _$SubdistrictState {
  const factory SubdistrictState.initial() = _Initial;
  const factory SubdistrictState.loading() = _Loading;
  const factory SubdistrictState.erorr(String message) = _Erorr;
  const factory SubdistrictState.loaded(List<Subdistrict> subdistrict) =
      _Loaded;
}
