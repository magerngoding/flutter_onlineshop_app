import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    //   final countryNotifier = ValueNotifier(country.first);
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final provinceController = TextEditingController();
    final zipCodeController = TextEditingController();
    final phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const SpaceHeight(24.0),
          CustomTextField(
            controller: firstNameController,
            label: 'Nama',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: addressController,
            label: 'Alamat lengkap',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: cityController,
            label: 'Kota',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: provinceController,
            label: 'Provinsi',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Kode Pos',
          ),
          const SpaceHeight(24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'No Handphone',
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              context.pop();
            },
            label: 'Tambah Alamat',
          ),
        ],
      ),
    );
  }
}
