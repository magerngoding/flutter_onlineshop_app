import '../../../core/assets/assets.gen.dart';

class BankAccountModel {
  final String code;
  final String name;
  final String image;

  BankAccountModel({
    required this.code,
    required this.name,
    required this.image,
  });
}

final banks = [
  BankAccountModel(
    code: 'BRI',
    name: 'BRI Virtual Account',
    image: Assets.images.banks.bRIDirectDebit.path,
  ),
  BankAccountModel(
    code: 'BCA',
    name: 'BCA Virtual Account',
    image: Assets.images.banks.bca.path,
  ),
  BankAccountModel(
    code: 'MANDIRI',
    name: 'Bank Mandiri',
    image: Assets.images.banks.mandiri.path,
  ),
];
