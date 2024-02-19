import 'package:flutter_onlineshop_app/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  // pakai void karena tidak butuh kembalian
  Future<void> saveAuthData(AuthResponseModel) async {
    // Save auth data to local storage kaya gini
    final prefs = await SharedPreferences.getInstance();

    // auth_data adalah nama file yang disimpan dilocal
    await prefs.setString('auth_data', AuthResponseModel.toJson());
  }

  // Hapus data dari local storage
  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  // Get auth data dari local storage
  Future<AuthResponseModel?> getAuthData() async {
    // diget instance dulu kaya biasa
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      return null;
    }
  }

  // Cek user sedang login atau tidak
  Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return true; // Berati ada yang login
    } else {
      return false;
    }
  }
}
